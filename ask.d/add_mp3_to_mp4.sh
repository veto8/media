#!/bin/sh
# id: 2
# desc: Add MP3 to MP4

. "$(dirname "$0")/lib_path"

printf "  Video file [v1.mp4]: "
read -r video
video=${video:-v1.mp4}

printf "  Audio file [a1.mp3]: "
read -r audio
audio=${audio:-a1.mp3}

printf "  Output file [v2.mp4]: "
read -r output
output=${output:-v2.mp4}

video=$(expand_path "$video")
audio=$(expand_path "$audio")
output=$(expand_path "$output")

ffmpeg -i "$video" -i "$audio" -c:v copy -map 0:v -map 1:a -y "$output"
