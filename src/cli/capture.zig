// src/cli/run.zig
const std = @import("std");
const zli = @import("zli");
const screenshot = @import("../lib/screenshot.zig");
const win = @import("../lib/win.zig");

const hwnd_flag = zli.Flag{
    .name = "hwnd",
    .description = "Target hwnd instead",
    .type = .Bool,
    .default_value = .{ .Bool = false },
};

// This function will be called by root.zig to get this command
pub fn register(allocator: std.mem.Allocator) !*zli.Command {
    const cmd = try zli.Command.init(
        allocator,
        .{
            .name = "capture",
            .description = "Capture screenshot of a window by title",
        },
        runWorkflow,
    ); // The function to execute for `blitz run`

    try cmd.addPositionalArg(.{
        .name = "target",
        .description = "The target of the window to capture",
        .required = true,
    });

    try cmd.addPositionalArg(.{
        .name = "output",
        .description = "The output file path for the screenshot (e.g., output.png)",
        .required = false,
    });

    try cmd.addFlag(hwnd_flag);

    // We'll add flags and args in the next steps
    return cmd;
}

// The execution logic for the `run` command
fn runWorkflow(ctx: zli.CommandContext) !void {
    std.debug.print("Executing the run workflow...\n", .{});
    // Access flags and args using ctx, e.g.:
    // const verbose = ctx.flag("verbose", bool);
    // const script_name = ctx.getArg("script") orelse "default.script";
    // ...

    const target = ctx.getArg("target") orelse {
        // Should not happen if zli enforces required args, but good for clarity
        // or if you manually handle this logic.
        // zli's help generation will indicate it's required.
        // Actual enforcement might be manual or zli might error before execFn.
        try ctx.command.stderr.print("Error: Missing required argument 'title'.\n", .{});
        try ctx.command.printHelp();
        return error.MissingRequiredArg; // Or an appropriate error
    };

    const output = ctx.getArg("output") orelse "screenshot.png";
    const is_hwnd = ctx.flag("hwnd", bool);

    if (is_hwnd) {
        const hwnd_val = try std.fmt.parseInt(usize, target, 10);
        const hwnd: win.HWND = @ptrFromInt(hwnd_val);
        try screenshot.captureWindow(hwnd, output);
    } else {
        try screenshot.capture(target, output);
    }
}
