

NAME=/tmp/screen1_recording_`date '+%Y-%m-%d_%H-%M-%S'`
echo "Saving to $NAME"
ffmpeg -y \
    -video_size 1920x1080 \
    -framerate 30 -f x11grab -i :1.0 \
    $NAME.mp4 &> $NAME.log
