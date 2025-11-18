#!/bin/bash

# Get sox and ffmpeg
# sudo apt-get install sox ffmpeg

# sudo chmod +x yt-dlp
# sudo mv yt-dlp /usr/bin/

ffmpeg -i a.m4a a.wav 
sox a.wav a2.wav trim 8 -60
ffmpeg -i a2.wav a2.mp3

