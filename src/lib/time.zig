const std = @import("std");

const c = @cImport({
    @cInclude("time.h");
});

pub fn nowLocalTime() c.struct_tm {
    var now: c.time_t = @intCast(std.time.timestamp());
    const tm_ptr = c.localtime(&now); // returns *c.struct_tm
    return tm_ptr.*; // copy the struct
}
