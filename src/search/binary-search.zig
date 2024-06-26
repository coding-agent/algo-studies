/// Binary search is a fast search algorithms
/// By dividing the search area in half if the target is not found
/// avoinding the need to check linearly all elements in the array
///
/// time complexity: o(log n)
/// space complexity: o(1)
/// note: if using recursion the call stack overhead
const std = @import("std");
const testing = std.testing;
const utils = @import("search_utils.zig");
const assertInteger = utils.assertInteger;

const BinarySearchOptions = struct {
    // not using recursion by default
    rercusive: bool = false,
};

pub fn search(array: anytype, target: @typeInfo(@TypeOf(array)).Array.child, options: BinarySearchOptions) ?@TypeOf(array[0]) {
    assertInteger(@TypeOf(array));

    if (options.rercusive) {
        @panic("Not implemented yet");
    }

    var left: usize = 0;
    var right: usize = array.len - 1;
    while (left < right) {
        const mid: usize = (left + right) / 2;

        if (array[mid] == target) {
            return target;
        }
        if (array[mid] < target) {
            left = mid + 1;
        }
        if (array[mid] > target) {
            right = mid;
        }
    }

    return null;
}

// TODO: implement recursive search
pub fn searchRecursive(comptime T: type, array: []T, target: T) i8 {
    _ = target;
    _ = array;
    @panic("Recursive search not implemented");
}

fn recursion(array: []i8) []i8 {
    _ = array;
}

test "test binary search" {
    const array = [_]i8{ 1, 2, 3, 4, 6, 7, 8, 9, 10, 12 };
    try testing.expectEqual(null, search(array, 5, .{}));
    try testing.expectEqual(4, search(array, 4, .{}));
    try testing.expectEqual(8, search(array, 8, .{}));
}
