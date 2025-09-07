// Virtual-Key Codes from Microsoft docs:
// https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes

pub const VK_LBUTTON: u32 = 0x01;
pub const VK_RBUTTON: u32 = 0x02;
pub const VK_CANCEL: u32 = 0x03;
pub const VK_MBUTTON: u32 = 0x04;
pub const VK_XBUTTON1: u32 = 0x05;
pub const VK_XBUTTON2: u32 = 0x06;
pub const VK_BACK: u32 = 0x08;
pub const VK_TAB: u32 = 0x09;
pub const VK_CLEAR: u32 = 0x0C;
pub const VK_RETURN: u32 = 0x0D;
pub const VK_SHIFT: u32 = 0x10;
pub const VK_CONTROL: u32 = 0x11;
pub const VK_MENU: u32 = 0x12; // Alt
pub const VK_PAUSE: u32 = 0x13;
pub const VK_CAPITAL: u32 = 0x14;
pub const VK_KANA: u32 = 0x15;
pub const VK_HANGUL: u32 = 0x15;
pub const VK_IME_ON: u32 = 0x16;
pub const VK_JUNJA: u32 = 0x17;
pub const VK_FINAL: u32 = 0x18;
pub const VK_HANJA: u32 = 0x19;
pub const VK_KANJI: u32 = 0x19;
pub const VK_IME_OFF: u32 = 0x1A;
pub const VK_ESCAPE: u32 = 0x1B;
pub const VK_CONVERT: u32 = 0x1C;
pub const VK_NONCONVERT: u32 = 0x1D;
pub const VK_ACCEPT: u32 = 0x1E;
pub const VK_MODECHANGE: u32 = 0x1F;
pub const VK_SPACE: u32 = 0x20;
pub const VK_PRIOR: u32 = 0x21; // Page Up
pub const VK_NEXT: u32 = 0x22; // Page Down
pub const VK_END: u32 = 0x23;
pub const VK_HOME: u32 = 0x24;
pub const VK_LEFT: u32 = 0x25;
pub const VK_UP: u32 = 0x26;
pub const VK_RIGHT: u32 = 0x27;
pub const VK_DOWN: u32 = 0x28;
pub const VK_SELECT: u32 = 0x29;
pub const VK_PRINT: u32 = 0x2A;
pub const VK_EXECUTE: u32 = 0x2B;
pub const VK_SNAPSHOT: u32 = 0x2C; // Print Screen
pub const VK_INSERT: u32 = 0x2D;
pub const VK_DELETE: u32 = 0x2E;
pub const VK_HELP: u32 = 0x2F;

// Number keys
pub const VK_0: u32 = 0x30;
pub const VK_1: u32 = 0x31;
pub const VK_2: u32 = 0x32;
pub const VK_3: u32 = 0x33;
pub const VK_4: u32 = 0x34;
pub const VK_5: u32 = 0x35;
pub const VK_6: u32 = 0x36;
pub const VK_7: u32 = 0x37;
pub const VK_8: u32 = 0x38;
pub const VK_9: u32 = 0x39;

// Letters
pub const VK_A: u32 = 0x41;
pub const VK_B: u32 = 0x42;
pub const VK_C: u32 = 0x43;
pub const VK_D: u32 = 0x44;
pub const VK_E: u32 = 0x45;
pub const VK_F: u32 = 0x46;
pub const VK_G: u32 = 0x47;
pub const VK_H: u32 = 0x48;
pub const VK_I: u32 = 0x49;
pub const VK_J: u32 = 0x4A;
pub const VK_K: u32 = 0x4B;
pub const VK_L: u32 = 0x4C;
pub const VK_M: u32 = 0x4D;
pub const VK_N: u32 = 0x4E;
pub const VK_O: u32 = 0x4F;
pub const VK_P: u32 = 0x50;
pub const VK_Q: u32 = 0x51;
pub const VK_R: u32 = 0x52;
pub const VK_S: u32 = 0x53;
pub const VK_T: u32 = 0x54;
pub const VK_U: u32 = 0x55;
pub const VK_V: u32 = 0x56;
pub const VK_W: u32 = 0x57;
pub const VK_X: u32 = 0x58;
pub const VK_Y: u32 = 0x59;
pub const VK_Z: u32 = 0x5A;

// Special keys
pub const VK_LWIN: u32 = 0x5B;
pub const VK_RWIN: u32 = 0x5C;
pub const VK_APPS: u32 = 0x5D;
pub const VK_SLEEP: u32 = 0x5F;

// Numpad
pub const VK_NUMPAD0: u32 = 0x60;
pub const VK_NUMPAD1: u32 = 0x61;
pub const VK_NUMPAD2: u32 = 0x62;
pub const VK_NUMPAD3: u32 = 0x63;
pub const VK_NUMPAD4: u32 = 0x64;
pub const VK_NUMPAD5: u32 = 0x65;
pub const VK_NUMPAD6: u32 = 0x66;
pub const VK_NUMPAD7: u32 = 0x67;
pub const VK_NUMPAD8: u32 = 0x68;
pub const VK_NUMPAD9: u32 = 0x69;
pub const VK_MULTIPLY: u32 = 0x6A;
pub const VK_ADD: u32 = 0x6B;
pub const VK_SEPARATOR: u32 = 0x6C;
pub const VK_SUBTRACT: u32 = 0x6D;
pub const VK_DECIMAL: u32 = 0x6E;
pub const VK_DIVIDE: u32 = 0x6F;

// Function keys
pub const VK_F1: u32 = 0x70;
pub const VK_F2: u32 = 0x71;
pub const VK_F3: u32 = 0x72;
pub const VK_F4: u32 = 0x73;
pub const VK_F5: u32 = 0x74;
pub const VK_F6: u32 = 0x75;
pub const VK_F7: u32 = 0x76;
pub const VK_F8: u32 = 0x77;
pub const VK_F9: u32 = 0x78;
pub const VK_F10: u32 = 0x79;
pub const VK_F11: u32 = 0x7A;
pub const VK_F12: u32 = 0x7B;
pub const VK_F13: u32 = 0x7C;
pub const VK_F14: u32 = 0x7D;
pub const VK_F15: u32 = 0x7E;
pub const VK_F16: u32 = 0x7F;
pub const VK_F17: u32 = 0x80;
pub const VK_F18: u32 = 0x81;
pub const VK_F19: u32 = 0x82;
pub const VK_F20: u32 = 0x83;
pub const VK_F21: u32 = 0x84;
pub const VK_F22: u32 = 0x85;
pub const VK_F23: u32 = 0x86;
pub const VK_F24: u32 = 0x87;

// Lock keys
pub const VK_NUMLOCK: u32 = 0x90;
pub const VK_SCROLL: u32 = 0x91;

// Shift/Control/Alt
pub const VK_LSHIFT: u32 = 0xA0;
pub const VK_RSHIFT: u32 = 0xA1;
pub const VK_LCONTROL: u32 = 0xA2;
pub const VK_RCONTROL: u32 = 0xA3;
pub const VK_LMENU: u32 = 0xA4; // Left Alt
pub const VK_RMENU: u32 = 0xA5; // Right Alt

// Browser keys
pub const VK_BROWSER_BACK: u32 = 0xA6;
pub const VK_BROWSER_FORWARD: u32 = 0xA7;
pub const VK_BROWSER_REFRESH: u32 = 0xA8;
pub const VK_BROWSER_STOP: u32 = 0xA9;
pub const VK_BROWSER_SEARCH: u32 = 0xAA;
pub const VK_BROWSER_FAVORITES: u32 = 0xAB;
pub const VK_BROWSER_HOME: u32 = 0xAC;

// Media keys
pub const VK_VOLUME_MUTE: u32 = 0xAD;
pub const VK_VOLUME_DOWN: u32 = 0xAE;
pub const VK_VOLUME_UP: u32 = 0xAF;
pub const VK_MEDIA_NEXT_TRACK: u32 = 0xB0;
pub const VK_MEDIA_PREV_TRACK: u32 = 0xB1;
pub const VK_MEDIA_STOP: u32 = 0xB2;
pub const VK_MEDIA_PLAY_PAUSE: u32 = 0xB3;
pub const VK_LAUNCH_MAIL: u32 = 0xB4;
pub const VK_LAUNCH_MEDIA_SELECT: u32 = 0xB5;
pub const VK_LAUNCH_APP1: u32 = 0xB6;
pub const VK_LAUNCH_APP2: u32 = 0xB7;

// OEM keys
pub const VK_OEM_1: u32 = 0xBA; // ';:' for US
pub const VK_OEM_PLUS: u32 = 0xBB; // '+' any country
pub const VK_OEM_COMMA: u32 = 0xBC; // ',' any country
pub const VK_OEM_MINUS: u32 = 0xBD; // '-' any country
pub const VK_OEM_PERIOD: u32 = 0xBE; // '.' any country
pub const VK_OEM_2: u32 = 0xBF; // '/?' for US
pub const VK_OEM_3: u32 = 0xC0; // '`~' for US

pub const VK_OEM_4: u32 = 0xDB; // '[{' for US
pub const VK_OEM_5: u32 = 0xDC; // '\|' for US
pub const VK_OEM_6: u32 = 0xDD; // ']}' for US
pub const VK_OEM_7: u32 = 0xDE; // ''"' for US
pub const VK_OEM_8: u32 = 0xDF;

// IME keys
pub const VK_PROCESSKEY: u32 = 0xE5;
pub const VK_PACKET: u32 = 0xE7;

// Attn/CrSel/ExSel keys
pub const VK_ATTN: u32 = 0xF6;
pub const VK_CRSEL: u32 = 0xF7;
pub const VK_EXSEL: u32 = 0xF8;
pub const VK_EREOF: u32 = 0xF9;
pub const VK_PLAY: u32 = 0xFA;
pub const VK_ZOOM: u32 = 0xFB;
pub const VK_NONAME: u32 = 0xFC;
pub const VK_PA1: u32 = 0xFD;
pub const VK_OEM_CLEAR: u32 = 0xFE;
