# Samm's Hyprland Dotfiles

- These are my personal configuration files for the Hyprland Wayland compositor adapted for my own system.
- It is recommend to read `hyprland.conf` and make changes.
- Please modify Monitors on `hyprland.conf`, `hyprpaper.conf`, `scrpits/videowallaper.sh`.
- Don't forget to run `install.sh` to symlink required files `kitty` & `dunst`. You don't have to move other folders such as `dunst`, `kitty`, `swayosd`, `wayvar`, `wlogout`. They're modified to run inside hypr folder.
- Use `video30.sh` script to make any video run as 30fps and create an image for `pywal` and `hyprpaper`. Files will move automatically to `vldeowallpapers/`.

## Setup

1.  Clone this repository to your `~/.config/` directory:
    ```bash
    git clone https://github.com/samm8g/dotfiles ~/.config/hypr
    ```
2.  Install the dependencies listed below.
3.  Reload Hyprland for the changes to take effect.

## Dependencies

This configuration relies on the following software:

*   **Compositor:** `hyprland`
*   **Status Bar:** `waybar`
*   **Application Launcher:** `rofi`
*   **Terminal:** `kitty`
*   **File Manager:** `dolphin`
*   **Web Browser:** `firefox`
*   **Notification Daemon:** `dunst`
*   **Screen Locker:** `hyprlock`
*   **Power Menu:** `wlogout`
*   **Wallpaper:** `hyprpaper`, `mpvpaper` (for video wallpapers)
*   **On-Screen Display:** `swayosd`
*   **Clipboard Manager:** `cliphist`, `wl-paste`, `wl-clip-persist`
*   **Screenshot Tool:** `hyprshot` (customized)
*   **Other:** `krunner`, `gnome-calculator`

## Keybindings

Here are some of the most important keybindings:

| Keybinding          | Action                               |
| ------------------- | ------------------------------------ |
| `SUPER + Q`         | Close active window                  |
| `SUPER + ESC + Mouse` | Kill selected window               |
| `SUPER + F`         | Toggle floating mode for a window    |
| `SUPER + P`         | Toggle pseudotiling                  |
| `SUPER + S`         | Toggle split layout                  |
| `SUPER + T`         | Open terminal (`kitty`)              |
| `SUPER + E`         | Open file manager (`dolphin`)        |
| `SUPER + Y`         | Open web browser (`firefox`)         |
| `SUPER + D`         | Open application menu (`rofi`)       |
| `SUPER + M`         | Open power menu (`wlogout`)          |
| `SUPER + R`         | Open command runner (`krunner`)      |
| `SUPER + L`         | Lock the screen (`hyprlock`)         |
| `SUPER + V`         | Show clipboard history (`cliphist`)  |
| `SUPER + X`         | Show video wallpaper changer         |
| `SUPER + Arrow Keys`| Move focus between windows           |
| `SUPER + CTRL + Arrow Keys` | Switch workspace             |
| `SUPER + CTRL + SHIFT + Arrow Keys` | Move window to workspace    |
| `SUPER + [1-9]`     | Switch to workspace 1-9              |
| `SUPER + SHIFT + [1-9]` | Move window to workspace 1-9     |
| `Print Screen`      | Take a screenshot (full screen)      |
| `SUPER + SHIFT + S` | Take a screenshot (region)           |
