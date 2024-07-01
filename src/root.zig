const std = @import("std");
const testing = std.testing;

test {
    _ = BinarySearch;
    _ = JumpSearch;
    _ = InterpolationSearch;
}

pub const BinarySearch = @import("search/binary-search.zig");
pub const JumpSearch = @import("search/jump-search.zig");
pub const InterpolationSearch = @import("search/interpolation-search.zig");
