#!/bin/bash

# ==========================================================
# FFmpeg Video Compressor
# Author: Rishi
# ==========================================================

# Default Settings
CRF=28                 # Lower = Better quality (18-23 high quality, 28 good compression)
PRESET="medium"        # ultrafast, superfast, veryfast, faster, fast, medium, slow, slower, veryslow
AUDIO_BITRATE="128k"
OUTPUT_DIR="compressed"

# Create output folder
mkdir -p "$OUTPUT_DIR"

compress_video() {

    input="$1"

    filename=$(basename "$input")
    extension="${filename##*.}"
    name="${filename%.*}"

    output="$OUTPUT_DIR/${name}_compressed.mp4"

    if [ -f "$output" ]; then
        echo "[SKIPPED] $output already exists."
        return
    fi

    echo "--------------------------------------------"
    echo "Compressing:"
    echo "$filename"
    echo "--------------------------------------------"

    ffmpeg -hide_banner -stats -y \
        -i "$input" \
        -map 0:v:0 \
        -map 0:a? \
        -c:v libx264 \
        -preset $PRESET \
        -crf $CRF \
        -pix_fmt yuv420p \
        -movflags +faststart \
        -c:a aac \
        -b:a $AUDIO_BITRATE \
        "$output"

    echo ""
    echo "Done -> $output"

    echo "Original:"
    du -h "$input"

    echo "Compressed:"
    du -h "$output"

    echo ""
}

# Check FFmpeg
if ! command -v ffmpeg >/dev/null 2>&1; then
    echo "FFmpeg not installed."
    echo "Ubuntu/Debian:"
    echo "sudo apt install ffmpeg"
    exit 1
fi

# Validate argument
if [ $# -eq 0 ]; then
    echo "Usage:"
    echo "./video_compressor.sh <video file>"
    echo "./video_compressor.sh <directory>"
    exit 1
fi

TARGET="$1"

# Single File
if [ -f "$TARGET" ]; then
    compress_video "$TARGET"

# Directory
elif [ -d "$TARGET" ]; then

    find "$TARGET" -type f \( \
        -iname "*.mp4" -o \
        -iname "*.mov" -o \
        -iname "*.avi" -o \
        -iname "*.mkv" -o \
        -iname "*.webm" -o \
        -iname "*.flv" \
    \) | while read file; do
        compress_video "$file"
    done

else
    echo "Invalid file or directory."
fi
