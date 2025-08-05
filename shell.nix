{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    bluetui
    cliphist
    dunst
    gnome-calculator
    grim
    hyprcursor
    hypridle
    hyprland
    hyprlock
    hyprpaper
    hyprpicker
    hyprpolkitagent
    hyprsunset
    imagemagick
    jq
    kdePackages.qt6ct
    kitty
    libnotify
    mpvpaper
    nwg-clipman
    playerctl
    pwvucontrol
    pywal16
    pywalfox-native
    rofi
    slurp
    swayosd
    tty-clock
    waybar
    wl-clipboard-rs
    wlogout
    xfce.thunar
  ];

  shellHook = ''
    dbus-launch --exit-with-session Hyprland
  '';
}
