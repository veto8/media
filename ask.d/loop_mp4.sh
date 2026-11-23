#!/bin/sh
# id: 3
# desc: Loop MP4 video

. "$(dirname "$0")/lib_path"

printf "  Video file [v1.mp4]: "
read -r video
video=${video:-v1.mp4}

printf "  Output file [v2.mp4]: "
read -r output
output=${output:-v2.mp4}

video=$(expand_path "$video")
output=$(expand_path "$output")

printf "  Loop count [20]: "
read -r count
count=${count:-20}

ffmpeg -stream_loop "$count" -i "$video" -c copy "$output"
