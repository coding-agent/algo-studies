const std = @import("std");
const testing = std.testing;

test {
    _ = BinarySearch;
}

pub const BinarySearch = @import("search/binary-search.zig");
pub const JumpSearch = @import("search/jump-search.zig");
