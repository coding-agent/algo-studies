const std = @import("std");
const testing = std.testing;

const BinarySearchOptions = struct {
    // not using recursion by default
    rercusive: bool = false,
};

pub fn search(array: anytype, target: anytype, options: BinarySearchOptions) ?@TypeOf(array[0]) {
    assertNumber(@TypeOf(array));
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
            left = mid;
        }
        if (array[mid] > target) {
            right = mid;
        }
        if ((left + 1) == right) {
            return null;
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

fn assertNumber(comptime T: type) void {
    switch (@typeInfo(T)) {
        .Array => |info| switch (@typeInfo(info.child)) {
            .Float, .ComptimeFloat, .ComptimeInt, .Int => return,
            else => @compileError("binary search not implemented for " ++ @typeName(T)),
        },
        else => @compileError("binary search exepects an array instead of " ++ @typeName(T)),
    }
}

test "test binary search" {
    const array = [_]i8{ 1, 2, 3, 4, 6, 7, 8, 9, 10, 12 };
    try testing.expectEqual(null, search(array, 5, .{}));
    try testing.expectEqual(4, search(array, 4, .{}));
    try testing.expectEqual(8, search(array, 8, .{}));
}
