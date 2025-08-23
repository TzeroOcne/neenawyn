// src/main.zig
const std = @import("std");
const cli_root = @import("cli/root.zig"); // Your root command definition

pub const UNICODE = true;

pub fn main() !void {
    // It's good practice to use a general-purpose allocator.
    // std.heap.page_allocator is also a common choice for CLIs.
    const allocator = std.heap.smp_allocator;
    //
    // // Build the command structure
    var root_command = try cli_root.build(allocator);
    defer root_command.deinit(); // Ensure all command resources are freed

    // Execute the command based on os.args
    // You can pass custom data here if needed:
    // try root_command.execute(.{ .data = &my_custom_data });
    try root_command.execute(.{});
}
