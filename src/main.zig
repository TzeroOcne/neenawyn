//! By convention, main.zig is where your main function lives in the case that
//! you are building an executable. If you are making a library, the convention
//! is to delete this file and start with root.zig instead.

const std = @import("std");
const lib = @import("neenawyn_lib");
const win32 = @import("win32");

pub const UNICODE = true;

const gui = win32.ui.windows_and_messaging;
const gdi = win32.graphics.gdi;

pub fn main() !void {
    const window_name = std.unicode.utf8ToUtf16LeStringLiteral("Calculator");

    _ = gui.SetProcessDPIAware();

    const hwnd = gui.FindWindow(null, window_name);
    var rect: win32.foundation.RECT = undefined;
    _ = gui.GetWindowRect(hwnd, &rect);

    std.debug.print("Window handle: {?}\n", .{hwnd});
    std.debug.print("Window rect: {d}, {d}, {d}, {d}\n", .{
        rect.left, rect.top, rect.right, rect.bottom,
    });

    const width = rect.right - rect.left;
    const height = rect.bottom - rect.top;

    std.debug.print("Window size: {d}x{d}\n", .{ width, height });

    const hwndDC = gdi.GetWindowDC(hwnd);
    const compDC = gdi.CreateCompatibleDC(hwndDC);

    const bitmap = gdi.CreateCompatibleBitmap(compDC, width, height);

    std.debug.print("Bitmap: {?}\n", .{bitmap});
}
