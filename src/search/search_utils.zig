pub fn assertInteger(comptime T: type) void {
    switch (@typeInfo(T)) {
        .Array => |info| switch (@typeInfo(info.child)) {
            .ComptimeInt, .Int => return,
            else => @compileError("not implemented for " ++ @typeName(T) ++ ", expected integer"),
        },
        else => @compileError("expects an array instead of " ++ @typeName(T)),
    }
}
