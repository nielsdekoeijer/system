#!/bin/bash
set -e

# Function to display the last message
cleanup() {
    echo "Recording stopped. The output is saved to $MOV"
    exit 0
}

# Trap the SIGINT signal (Ctrl+C)
trap cleanup SIGINT

# Get the active monitor and its resolution
ACTIVE_MONITOR=$(xrandr --query | grep ' connected' | grep -v ' disconnected' | grep ' primary' | awk '{print $1}')
RESOLUTION=$(xrandr | grep "$ACTIVE_MONITOR connected" | grep -o '[0-9]\+x[0-9]\+')

# Determine the output file name
RECORDING_FILENAME=/tmp/screen_recording_$(date '+%Y-%m-%d_%H-%M-%S')
MOV="$RECORDING_FILENAME.mp4"
ln -sf $MOV /tmp/mov

echo "Recording to $RECORDING_FILENAME..."
echo "Active monitor: $ACTIVE_MONITOR"
echo "Resolution: $RESOLUTION"

# Record the screen
ffmpeg -y \
    -video_size $RESOLUTION \
    -framerate 30 -f x11grab -i :0.0+$(xrandr | grep "$ACTIVE_MONITOR connected" | grep -oP '(?<=\+)\d+\+\d+' | head -n 1 | tr '+' ',') \
    $MOV | tee -a $RECORDING_FILENAME.log

# If the script reaches this point, it means recording finished successfully
cleanup

