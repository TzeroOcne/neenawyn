// src/cli/run.zig
const std = @import("std");
const zli = @import("zli");
const screenshot = @import("../lib/screenshot.zig");

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

    // We'll add flags and args in the next steps
    return cmd;
}

// The execution logic for the `run` command
fn runWorkflow(_: zli.CommandContext) !void {
    std.debug.print("Executing the run workflow...\n", .{});
    // Access flags and args using ctx, e.g.:
    // const verbose = ctx.flag("verbose", bool);
    // const script_name = ctx.getArg("script") orelse "default.script";
    // ...

    try screenshot.capture("ZenlessZoneZero");
}
