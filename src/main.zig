const std = @import("std");
const win32 = @import("win32");
const zigimg = @import("zigimg");

pub const UNICODE = true;
const gui = win32.ui.windows_and_messaging;
const gdi = win32.graphics.gdi;
const xps = win32.storage.xps;

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    const window_name = std.unicode.utf8ToUtf16LeStringLiteral("Calculator");

    _ = gui.SetProcessDPIAware();

    const hwnd = gui.FindWindow(null, window_name);
    if (hwnd == null) return error.WindowNotFound;

    var rect: win32.foundation.RECT = undefined;
    _ = gui.GetWindowRect(hwnd, &rect);

    const width = rect.right - rect.left;
    const height = rect.bottom - rect.top;

    // --- Setup DCs and bitmap ---
    const hwndDC = gdi.GetWindowDC(hwnd);
    defer _ = gdi.ReleaseDC(hwnd, hwndDC);

    const memDC = gdi.CreateCompatibleDC(hwndDC);
    defer _ = gdi.DeleteDC(memDC);

    const bitmap = gdi.CreateCompatibleBitmap(hwndDC, width, height);
    defer _ = gdi.DeleteObject(bitmap);

    const oldBitmap = gdi.SelectObject(memDC, bitmap);
    defer _ = gdi.SelectObject(memDC, oldBitmap);

    // --- Capture the window ---
    const success = xps.PrintWindow(hwnd, memDC, xps.PRINT_WINDOW_FLAGS.C);
    if (success == 0) return error.PrintWindowFailed;

    // --- Convert HBITMAP to raw pixel buffer ---
    var bmp_info: gdi.BITMAPINFO = .{
        .bmiHeader = .{
            .biSize = @sizeOf(gdi.BITMAPINFOHEADER),
            .biWidth = width,
            .biHeight = -height,
            .biPlanes = 1,
            .biBitCount = 32,
            .biCompression = gdi.BI_RGB,
            .biSizeImage = 0,
            .biXPelsPerMeter = 0,
            .biYPelsPerMeter = 0,
            .biClrUsed = 0,
            .biClrImportant = 0,
        },
        .bmiColors = [_]gdi.RGBQUAD{.{ .rgbBlue = 0, .rgbGreen = 0, .rgbRed = 0, .rgbReserved = 0 }},
    };

    const row_bytes = width * 4;
    const total = row_bytes * height;
    var pixels = try allocator.alloc(u8, @intCast(total));

    const lines = gdi.GetDIBits(memDC, bitmap, 0, @intCast(height), &pixels[0], &bmp_info, gdi.DIB_RGB_COLORS);
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
