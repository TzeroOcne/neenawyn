// src/cli/root.zig
const std = @import("std");
const zli = @import("zli");

// Forward declare or import subcommand modules
// const run_cmd = @import("run.zig");
// const version_cmd = @import("version.zig");
const capture = @import("capture.zig");

// This function will be called to construct the root command
pub fn build(allocator: std.mem.Allocator) !*zli.Command {
    const root = try zli.Command.init(
        allocator,
        .{
            .name = "wyn",
            .description = "Neenawyn, a Window toolkit",
        },
        showHelp,
    ); // Default execFn if no subcommand is matched

    // Register subcommands
    try root.addCommands(&.{
        // try run_cmd.register(allocator),
        // try version_cmd.register(allocator),
        try capture.register(allocator),
    });

    return root;
}

// Default execution function for the root command (e.g., when `blitz` is run without subcommands)
fn showHelp(ctx: zli.CommandContext) !void {
    // Display the help message for the current command (root in this case)
    try ctx.command.printHelp();
}
