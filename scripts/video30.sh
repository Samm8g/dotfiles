#!/bin/sh

# --- Check if ffmpeg is installed ---
if ! command -v ffmpeg &> /dev/null
then
    echo "Error: ffmpeg is not installed."
    exit 1
fi

# --- Check if an input file is provided ---
if [ -z "$1" ]; then
    echo "Usage: $0 <input_video_file> [output_base_name]"
    echo "Example 1: $0 input.mp4"
    echo "Example 2: $0 input.mp4 my_converted_video"
    exit 1
fi

# --- Input video file ---
input_file="$1"

# --- Check if the input file exists ---
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found."
    exit 1
fi

# --- Determine the output base name ---
if [ -z "$2" ]; then
    # If no second argument is provided, use "Video" as the base name
    output_base="Video"
else
    # If a second argument is provided, use it as the output base name
    output_base="$2"
fi

# --- Define output file names ---
output_video="${output_base}30.mp4"
output_image="${output_base}30.png"

# --- Conversion to 1920x1080 30fps ---
echo "Converting video '$input_file' to 1920:1080 at 30fps..."
ffmpeg -i "$input_file" -vf 'scale=1920:1080' -r 30 "$output_video"
if [ $? -ne 0 ]; then
    echo "Error: Video conversion failed."
fi

# --- Extract the first frame as PNG ---
echo "Extracting the first frame of the downscaled video '$output_video' as '$output_image'..."
ffmpeg -i "$output_video" -vframes 1 "$output_image"
if [ $? -ne 0 ]; then
    echo "Error: First frame extraction from output video failed."
fi

echo "Conversion and first frame extraction complete."
echo "Output video: '$output_video'"
echo "Output image: '$output_image'"
echo "Moving files..."
mv $output_image $HOME/.config/hypr/videowallpapers
mv $output_video $HOME/.config/hypr/videowallpapers
exit 0
