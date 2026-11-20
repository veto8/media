#!/bin/sh
# id: 3
# desc: Loop MP4 video

printf "  Video file [v1.mp4]: "
read -r video
video=${video:-v1.mp4}

printf "  Output file [v2.mp4]: "
read -r output
output=${output:-v2.mp4}

printf "  Loop count [20]: "
read -r count
count=${count:-20}

ffmpeg -stream_loop "$count" -i "$video" -c copy "$output"
