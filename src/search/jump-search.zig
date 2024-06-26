/// Jump search is like linear search
/// but jumping the square root of the array len
/// until it either finds it of has jumped past it
/// if jumped past it then it performs a linear search
/// on the amount of elements it jumped
///
/// time complexity: O(√n)
/// space complexity: O(1)
const std = @import("std");
const math = std.math;
const testing = std.testing;
const utils = @import("search_utils.zig");
const assertInteger = utils.assertInteger;

pub fn search(array: anytype, target: anytype) ?@TypeOf(array[0]) {
    assertInteger(@TypeOf(array));

    const n = array.len;
    var start: usize = 0;
    var end: usize = math.sqrt(n);

    while (array[end] <= target and start < n) {
        start = end;
        end = end + math.sqrt(n);
        // ensure end doesn't go out of bounds
        if (end > n - 1) {
            end = n;
        }
    }

    for (array[start..end]) |value| {
        if (target == value) {
            return value;
        }
    }

    return null;
}

test "test jump search" {
    const array = [_]i8{ 1, 2, 3, 4, 6, 7, 8, 9, 10, 12 };
    try testing.expectEqual(null, search(array, 5));
    try testing.expectEqual(3, search(array, 3));
    try testing.expectEqual(10, search(array, 10));
}
