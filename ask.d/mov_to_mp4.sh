#!/bin/sh
# id: 5
# desc: Convert MOV to MP4

. "$(dirname "$0")/lib_path"

printf "  Input MOV [password_safari.mov]: "
read -r input
input=${input:-password_safari.mov}

printf "  Output MP4 [password_safari.mp4]: "
read -r output
output=${output:-password_safari.mp4}

input=$(expand_path "$input")
output=$(expand_path "$output")

ffmpeg -i "$input" -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -c:v libx264 -preset medium -crf 20 -c:a aac -b:a 192k -movflags +faststart -y "$output"
