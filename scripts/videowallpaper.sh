#!/bin/sh

# Set a robust PATH for NixOS environment
export PATH="$HOME/.nix-profile/bin:/run/current-system/sw/bin:$PATH"

# Define the directory containing your video wallpapers
video_dir="$HOME/.config/hypr/videowallpapers"
hypr_base_dir="$HOME/.config/hypr"

# List available video wallpapers
# if [ -z "$1" ]; then
#     echo "Available video wallpapers (.mp4) in $video_dir:"
#     find "$video_dir" -maxdepth 1 -type f -name "*.mp4" -printf '%f\n' | sort
# fi

wallpaper_list=$(find "$video_dir" -maxdepth 1 -type f -name "*.mp4" -printf '%f\n' | sort)
selected_wallpaper=$(echo "$wallpaper_list" | rofi -dmenu -p "Select Wallpaper" -i -l 10 -sync)
if [ -z "$selected_wallpaper" ]; then
    echo "Wallpaper selection cancelled."
    exit 0
fi

full_video_path="$video_dir/$selected_wallpaper"

# Prompt the user to enter the filename
# read -p "Enter the Name of the video wallpaper you want to use: " selected_video

# Construct the full path to the selected video
# full_video_path="$video_dir/${selected_video}30.mp4"

# Check if the selected video file exists
if [ -f "$full_video_path" ]; then

  # Create the symbolic link
  ln -sf "$full_video_path" "$hypr_base_dir/videowallpaper"
  #echo "Created symbolic link '$hypr_base_dir/videowallpaper' pointing to '$full_video_path'"

  # Read the target of the symbolic link
  video_path=$(readlink "$hypr_base_dir/videowallpaper" 2>/dev/null)

  # Extract the filename from the full path
  video_filename=$(basename "$video_path")

  # Remove the .mp4 extension and add .png
  image_filename="${video_filename%.mp4}.png"
  #echo "Extracted image filename: $image_filename"

  #echo "Started mpvpaper"
  pkill mpvpaper ; nohup mpvpaper -o "loop no-audio" "eDP-1" "$video_path" >/dev/null 2>&1 &

  # Define the directory where the .png might be located (assuming same as videos)
  image_dir=$(dirname "$video_path")
  full_image_path="$image_dir/$image_filename"

  ln -sf "$full_image_path" "$hypr_base_dir/wallpaper"
  pkill hyprpaper ; nohup hyprpaper >/dev/null 2>&1 &
  #echo "Started hyprpaper"

  #Pywal
  #echo "Applying pywal with image: $full_image_path"
  wal -n -i "$full_image_path"

  # Dunst
  #echo "Reloading Dunst"
  dunstctl reload

  # SwayOSD
  #echo "Restarting SwayOSD"
  pkill swayosd-server ; nohup swayosd-server --config ~/.config/hypr/swayosd/config.toml --style ~/.config/hypr/swayosd/style.css >/dev/null 2>&1 &

  # Pywal socket renewing
  # rm -rf /tmp/pywalfox_socket ; rm -rf /tmp/pywalfox_socket_alt
  pywalfox update

  #echo "Theme set! Quitting..."
  notify-send -u low "Theme set!" "Quitting..."


else
  # echo "Error: Video file '${selected_video}30.mp4' not found in '$video_dir'."
  # sleep 3
  exit 1
fi
exit 0
