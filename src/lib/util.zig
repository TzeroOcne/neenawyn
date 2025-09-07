const std = @import("std");
const win = @import("win.zig");
const time = @import("time.zig");

pub fn generateScreenshotFilename(allocator: std.mem.Allocator) ![]u8 {
    var buf: [64]u8 = undefined;

    // Current epoch time
    const tm = time.nowLocalTime();

    const filename = try std.fmt.bufPrint(
        &buf,
        "Screenshot {d:04}-{d:02}-{d:02} {d:02}{d:02}{d:02}.png",
        .{
            @as(u32, @intCast(tm.tm_year + 1900)),
            @as(u32, @intCast(tm.tm_mon + 1)),
            @as(u32, @intCast(tm.tm_mday)),
            @as(u32, @intCast(tm.tm_hour)),
            @as(u32, @intCast(tm.tm_min)),
            @as(u32, @intCast(tm.tm_sec)),
        },
    );

    return try allocator.dupe(u8, filename);
}
