/// Interpolation search
///
/// time complexity:
/// space complexity:
const std = @import("std");
const testing = std.testing;
const utils = @import("search_utils.zig");
const assertInteger = utils.assertInteger;

pub fn search(array: anytype, target: @typeInfo(@TypeOf(array)).Array.child) ?@TypeOf(array[0]) {
    assertInteger(@TypeOf(array));

    var left: usize = 0;
    var right: usize = array.len - 1;

    while (left < right) {
        const probe: usize = @intCast(@as(i64, @intCast(left)) + @divTrunc(@as(i64, @intCast(right - left)) * (target - array[left]), (array[right] - array[left])));

        if (array[probe] == target) {
            return target;
        }
        if (array[probe] < target) {
            left = probe + 1;
        }
        if (array[probe] > target) {
            right = probe;
        }
    }
    return null;
}

test "test interpolation search" {
    const array = [_]i64{ 1, 2, 4, 8, 16, 32, 64 };
    try testing.expectEqual(null, search(array, 5));
    try testing.expectEqual(4, search(array, 4));
}
