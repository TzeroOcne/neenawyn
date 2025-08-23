const screenshot = @import("screenshot.zig");

pub const UNICODE = true;

pub fn main() !void {
    try screenshot.exec("ZenlessZoneZero");
}
