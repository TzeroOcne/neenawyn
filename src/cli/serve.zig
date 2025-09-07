// src/cli/run.zig
const std = @import("std");
const zli = @import("zli");
const screenshot = @import("../lib/screenshot.zig");
const win = @import("../lib/win.zig");
const vk = @import("../lib/vk.zig");
const util = @import("../lib/util.zig");

const outputDirFlag = zli.Flag{
    .name = "output-dir",
    .shortcut = "-d",
    .description = "The output dir path for the screenshot (e.g., ~/Pictures/). Defaults to current dir.",
    .type = .String,
    .default_value = .{ .String = "./" },
};

// This function will be called by root.zig to get this command
pub fn register(allocator: std.mem.Allocator) !*zli.Command {
    const cmd = try zli.Command.init(
        allocator,
        .{
            .name = "serve",
            .description = "Run wyn in service mode, listening for hotkeys to capture screenshots.",
        },
        runWorkflow,
    ); // The function to execute for `blitz run`

    try cmd.addFlag(outputDirFlag);

    // We'll add flags and args in the next steps
    return cmd;
}

// The execution logic for the `run` command
fn runWorkflow(ctx: zli.CommandContext) !void {
    std.debug.print("Executing service...\n", .{});
    // Access flags and args using ctx, e.g.:
    // const verbose = ctx.flag("verbose", bool);
    // const script_name = ctx.getArg("script") orelse "default.script";
    // ...

    const outputDir = ctx.flag("output-dir", []const u8);

    const HOTKEY_HWND: c_int = 1;
    const HOTKEY_EXIT: c_int = 2;

    // Register F20 → print active window hwnd
    if (win.RegisterHotKey(null, HOTKEY_HWND, 0, vk.VK_F20) == 0) {
        std.debug.print("Failed to register F20 hotkey\n", .{});
        return;
    }

    // Register F24 → exit program
    if (win.RegisterHotKey(null, HOTKEY_EXIT, 0, vk.VK_F24) == 0) {
        std.debug.print("Failed to register F24 hotkey\n", .{});
        return;
    }

    std.debug.print("Hotkeys registered: F20(print hwnd), F24(exit)\n", .{});

    var msg: win.MSG = undefined;

    while (true) {
        const res = win.GetMessageA(&msg, null, 0, 0);
        if (res == 0) break; // WM_QUIT
        if (res == -1) {
            std.debug.print("GetMessage error\n", .{});
            break;
        }

        if (msg.message == win.WM_HOTKEY) {
            if (msg.wParam == HOTKEY_HWND) {
                const hwnd = win.GetForegroundWindow();
                std.debug.print("F20 pressed → Active hwnd = {*}\n", .{hwnd});
                const filename = try util.generateScreenshotFilename(ctx.allocator);

                const path = try std.fs.path.joinZ(ctx.allocator, &.{ outputDir, filename });
                defer ctx.allocator.free(path);

                try screenshot.captureWindow(hwnd, path);
            } else if (msg.wParam == HOTKEY_EXIT) {
                std.debug.print("F24 pressed → Exiting...\n", .{});
                break;
            }
        }

        _ = win.TranslateMessage(&msg);
        _ = win.DispatchMessageA(&msg);
    }

    _ = win.UnregisterHotKey(null, HOTKEY_HWND);
    _ = win.UnregisterHotKey(null, HOTKEY_EXIT);
    std.debug.print("Unregistered hotkeys and exiting.\n", .{});
}
