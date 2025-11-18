#!/bin/bash

# https://json2video.com/how-to/ffmpeg-course/ffmpeg-add-audio-to-video.html
 

ffmpeg \
    -i v1.mp4 -i a1.mp3 \
    -c:v copy \
    -map 0:v -map 1:a \
    -y v2.mp4
