#!/bin/sh
# id: 4
# desc: Trim audio (m4a to mp3)

printf "  Input file [a.m4a]: "
read -r input
input=${input:-a.m4a}

printf "  Trim start [8]: "
read -r start
start=${start:-8}

printf "  Trim end [-60]: "
read -r end
end=${end:--60}

ffmpeg -i "$input" a.wav || exit 1
sox a.wav a2.wav trim "$start" "$end" || exit 1
ffmpeg -i a2.wav a2.mp3
