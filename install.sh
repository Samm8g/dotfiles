#!/bin/sh
# This script creates symlinks from this repository to the appropriate locations in ~/.config

# Get the absolute path to the directory where the script is located
DOTFILES_DIR=$(cd "$(dirname "$0")" && pwd)

echo "Creating symlinks..."

# Link kitty config
mkdir -p ~/.config/kitty
ln -sf "$DOTFILES_DIR/kitty/kitty.conf" ~/.config/kitty/kitty.conf

# Link dunst config
mkdir -p ~/.config/wal/templates
ln -sf "$DOTFILES_DIR/dunst/dunstrc-config" ~/.config/wal/templates/dunstrc
ln -sf ~/.cache/wal/dunstrc "$DOTFILES_DIR/dunstrc/dunstrc"

echo "Symlinking complete."
