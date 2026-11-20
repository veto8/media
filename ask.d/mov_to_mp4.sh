#!/bin/sh
# id: 5
# desc: Convert MOV to MP4

printf "  Input MOV [password_safari.mov]: "
read -r input
input=${input:-password_safari.mov}

printf "  Output MP4 [password_safari.mp4]: "
read -r output
output=${output:-password_safari.mp4}

ffmpeg -i "$input" -c:v libx264 -preset medium -crf 20 -c:a aac -b:a 192k -movflags +faststart -y "$output"
