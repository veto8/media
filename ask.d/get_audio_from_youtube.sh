#!/bin/sh
# id: 1
# desc: Get audio from YouTube

URL_DEFAULT="https://www.youtube.com/watch?v=hCuMWrfXG4E"

printf "  YouTube URL [%s]: " "$URL_DEFAULT"
read -r url
url=${url:-$URL_DEFAULT}
[ -n "$url" ] || {
  printf "  No URL given\n"
  exit 1
}

printf "  yt-dlp format [140]: "
read -r format
format=${format:-140}

yt-dlp -f "$format" --audio-format m4a "$url"
