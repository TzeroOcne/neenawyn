pub const HWND = *opaque {};

pub const HDC = *opaque {};

// pub const PRINT_WINDOW_FLAGS = enum(u32) {
//     Y = 1,
//     C = 2,
//     A = 3,
// };

pub const BOOL = i32;

// TODO: this type is limited to platform 'windows5.1.2600'
pub extern "user32" fn PrintWindow(
    hwnd: ?HWND,
    hdcBlt: ?HDC,
    nFlags: u32,
) callconv(.winapi) BOOL;
