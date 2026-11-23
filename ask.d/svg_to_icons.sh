#!/bin/sh
# id: 7
# desc: SVG - make icons

. "$(dirname "$0")/lib_path"

printf "  Source SVG [source.svg]: "
read -r source
source=${source:-source.svg}

source=$(expand_path "$source")

convert "$source" -resize 320x320 screenshot_320x320.ico || exit 1
convert "$source" -resize 192x192 icon_192x192.ico || exit 1
convert "$source" -resize 512x512 icon_512x512.png || exit 1
convert "$source" -resize 104x104 logo.png || exit 1
convert "$source" -resize 64x64 ../favicon.ico || exit 1
convert "$source" -resize 384x384 ../favicon.png || exit 1
