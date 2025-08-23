const std = @import("std");
const zigimg = @import("zigimg");
const win = @import("lib/win.zig");

pub const UNICODE = true;

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    const window_name = std.unicode.utf8ToUtf16LeStringLiteral("ZenlessZoneZero");

    _ = win.SetProcessDPIAware();

    const hwnd = win.FindWindow(null, window_name);
    if (hwnd == null) return error.WindowNotFound;

    var rect: win.RECT = undefined;
    // _ = gui.GetWindowRect(hwnd, &rect);
    _ = win.GetClientRect(hwnd, &rect);

    const width = rect.right - rect.left;
    const height = rect.bottom - rect.top;

    // --- Setup DCs and bitmap ---
    const hwndDC = win.GetWindowDC(hwnd);
    defer _ = win.ReleaseDC(hwnd, hwndDC);

    const memDC = win.CreateCompatibleDC(hwndDC);
    defer _ = win.DeleteDC(memDC);

    const bitmap = win.CreateCompatibleBitmap(hwndDC, width, height);
    defer _ = win.DeleteObject(bitmap);

    const oldBitmap = win.SelectObject(memDC, bitmap);
    defer _ = win.SelectObject(memDC, oldBitmap);

    // --- Capture the window ---
    const success = win.PrintWindow(hwnd, memDC, .CLIENT_AND_FULL);
    if (success == 0) return error.PrintWindowFailed;

    // --- Convert HBITMAP to raw pixel buffer ---
    var bmp_info: win.BITMAPINFO = .{
        .bmiHeader = .{
            .biSize = @sizeOf(win.BITMAPINFOHEADER),
            .biWidth = width,
            .biHeight = -height,
            .biPlanes = 1,
            .biBitCount = 32,
            .biCompression = 0,
            .biSizeImage = 0,
            .biXPelsPerMeter = 0,
            .biYPelsPerMeter = 0,
            .biClrUsed = 0,
            .biClrImportant = 0,
        },
        .bmiColors = [_]win.RGBQUAD{.{ .rgbBlue = 0, .rgbGreen = 0, .rgbRed = 0, .rgbReserved = 0 }},
    };

    const row_bytes = width * 4;
    const total = row_bytes * height;
    var pixels = try allocator.alloc(u8, @intCast(total));

    const lines = win.GetDIBits(memDC, bitmap, 0, @intCast(height), &pixels[0], &bmp_info, .RGB_COLORS);
    if (lines == 0) return error.GetDIBitsFailed;

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    const gpaallocator = gpa.allocator();

    var image = try zigimg.Image.fromRawPixels(
        gpaallocator,
        @intCast(width),
        @intCast(height),
        pixels,
        .rgba32,
    );
    defer image.deinit();

    try image.writeToFilePath("screenshot.png", .{ .png = .{} });

    //
    // // --- Save using zigimg ---
    // var img = try zigimg.Image(.{
    //     .width = width,
    //     .height = height,
    //     .format = zigimg.PixelFormat.RGBA8,
    //     .pixels = pixels,
    // });
    //
    // try img.writePNG(allocator, "screenshot.png");
    //
    // std.debug.print("Saved screenshot.png\n", .{});
}
