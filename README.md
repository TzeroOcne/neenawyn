# Neenawyn

**Neenawyn** is a command-line tool that captures screenshots of a specified window based on its title or handle (HWND).  
It is built in **Zig** and currently supports **Windows only**.

## Features

- Capture screenshots of a specific window by its **title**.
- Capture screenshots using a window **handle (HWND)**.
- Save screenshots to a custom file path.
- Lightweight and fast CLI tool.

## Installation

1. **Clone the repository**:

~~~
git clone https://github.com/TzeroOcne/neenawyn.git
cd neenawyn
~~~

2. **Build the project**:

Make sure [Zig](https://ziglang.org/) is installed:

~~~
zig build
~~~

The executable will be available as `wyn.exe` in:

~~~
./zig-out/bin/
~~~

## Usage

### By Window Title

~~~
wyn.exe capture "Window Title" "C:\path\to\screenshot.png"
~~~

- `"Window Title"` — The exact title of the window to capture.
- `"C:\path\to\screenshot.png"` — Full path where the screenshot will be saved.

Example:

~~~
wyn.exe capture "ZenlessZoneZero" "C:\Users\You\Pictures\screen.png"
~~~

This will capture the `ZenlessZoneZero` window and save it as `screen.png`.

### By HWND

You can also capture using the **window handle (HWND)** instead of the title:

~~~
wyn.exe capture --hwnd 123456 "C:\Users\You\Pictures\hwnd_capture.png"
~~~

This will capture the window with handle `123456` and save it as `hwnd_capture.png`.

## Contributing

Contributions are welcome! Fork the repository, make changes, and submit a pull request.

