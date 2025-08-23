pub const HWND = *opaque {};

pub const HDC = *opaque {};

pub const RECT = extern struct {
    left: i32,
    top: i32,
    right: i32,
    bottom: i32,
};

pub const BOOL = i32;

const PW_FLAGS = enum(u32) {
    NONE = 0x00,
    CLIENT_ONLY = 0x01,
    RENDER_FULL_CONTENT = 0x02,
    CLIENT_AND_FULL = 0x03, // combination of CLIENT_ONLY | RENDER_FULL_CONTENT
};

pub const BITMAPINFOHEADER = extern struct {
    biSize: u32,
    biWidth: i32,
    biHeight: i32,
    biPlanes: u16,
    biBitCount: u16,
    biCompression: u32,
    biSizeImage: u32,
    biXPelsPerMeter: i32,
    biYPelsPerMeter: i32,
    biClrUsed: u32,
    biClrImportant: u32,
};

pub const RGBQUAD = extern struct {
    rgbBlue: u8,
    rgbGreen: u8,
    rgbRed: u8,
    rgbReserved: u8,
};

pub const BITMAPINFO = extern struct {
    bmiHeader: BITMAPINFOHEADER,
    bmiColors: [1]RGBQUAD,
};

pub const DIB_USAGE = enum(u32) {
    RGB_COLORS = 0,
    PAL_COLORS = 1,
};

const root = @import("root");
pub const UnicodeMode = enum { ansi, wide, unspecified };
pub const unicode_mode: UnicodeMode = if (@hasDecl(root, "UNICODE")) (if (root.UNICODE) .wide else .ansi) else .unspecified;

// TODO: this type is limited to platform 'windows5.0'
pub extern "user32" fn FindWindowA(
    lpClassName: ?[*:0]const u8,
    lpWindowName: ?[*:0]const u8,
) callconv(.winapi) ?HWND;

// TODO: this type is limited to platform 'windows5.0'
pub extern "user32" fn FindWindowW(
    lpClassName: ?[*:0]const u16,
    lpWindowName: ?[*:0]const u16,
) callconv(.winapi) ?HWND;

pub const FindWindow = switch (unicode_mode) {
    .ansi => @This().FindWindowA,
    .wide => @This().FindWindowW,
    .unspecified => if (@import("builtin").is_test) void else @compileError(
        "'FindWindow' requires that UNICODE be set to true or false in the root module",
    ),
};

// TODO: this type is limited to platform 'windows5.0'
pub extern "user32" fn GetWindowDC(
    hWnd: ?HWND,
) callconv(.winapi) ?HDC;

// TODO: this type is limited to platform 'windows5.0'
pub extern "gdi32" fn CreateCompatibleDC(
    hdc: ?HDC,
) callconv(.winapi) HDC;

// TODO: this type is limited to platform 'windows5.0'
pub extern "gdi32" fn CreateCompatibleBitmap(
    hdc: ?HDC,
    cx: i32,
    cy: i32,
) callconv(.winapi) ?HDC;

// TODO: this type is limited to platform 'windows5.0'
pub extern "gdi32" fn SelectObject(
    hdc: ?HDC,
    h: ?HDC,
) callconv(.winapi) ?HDC;

// TODO: this type is limited to platform 'windows5.0'
pub extern "gdi32" fn DeleteObject(
    ho: ?HDC,
) callconv(.winapi) BOOL;

// TODO: this type is limited to platform 'windows5.0'
pub extern "gdi32" fn DeleteDC(
    hdc: HDC,
) callconv(.winapi) BOOL;

// TODO: this type is limited to platform 'windows5.0'
pub extern "user32" fn ReleaseDC(
    hWnd: ?HWND,
    hDC: ?HDC,
) callconv(.winapi) i32;

// TODO: this type is limited to platform 'windows6.0.6000'
pub extern "user32" fn SetProcessDPIAware() callconv(.winapi) BOOL;

// TODO: this type is limited to platform 'windows5.0'
pub extern "user32" fn GetClientRect(
    hWnd: ?HWND,
    lpRect: ?*RECT,
) callconv(.winapi) BOOL;

// TODO: this type is limited to platform 'windows5.1.2600'
pub extern "user32" fn PrintWindow(
    hwnd: ?HWND,
    hdcBlt: ?HDC,
    nFlags: PW_FLAGS,
) callconv(.winapi) BOOL;

// TODO: this type is limited to platform 'windows5.0'
pub extern "gdi32" fn GetDIBits(
    hdc: ?HDC,
    hbm: ?HDC,
    start: u32,
    cLines: u32,
    lpvBits: ?*anyopaque,
    lpbmi: ?*BITMAPINFO,
    usage: DIB_USAGE,
) callconv(.winapi) i32;
