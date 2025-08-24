# Neenawyn

**Neenawyn** is a command-line tool that captures screenshots of a specified window based on its title.  
It is built in **Zig** and currently supports **Windows only**.

## Features

- Capture screenshots of a specific window by its title.
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

The executable will be available in `./build/`.

## Usage

Basic usage:

~~~
neenawyn capture "Window Title" "C:\path\to\screenshot.png"
~~~

- `"Window Title"` — The exact title of the window to capture.
- `"C:\path\to\screenshot.png"` — Full path where the screenshot will be saved.

Example:

~~~
neenawyn capture "ZenlessZoneZero" "C:\Users\You\Pictures\screen.png"
~~~

This will capture the `ZenlessZoneZero` window and save it as `screen.png`.

## Contributing

Contributions are welcome! Fork the repository, make changes, and submit a pull request.

