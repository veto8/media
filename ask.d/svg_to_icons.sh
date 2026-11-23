#!/bin/sh
# id: 7
# desc: SVG - make icons

. "$(dirname "$0")/lib_path"

printf "  Source SVG [source.svg]: "
read -r source
source=${source:-source.svg}

source=$(expand_path "$source")
source_root=$(dirname "$source")
default_output_dir="$source_root/pages/img"

printf "  Output directory [%s]: " "$default_output_dir"
read -r output_dir
output_dir=${output_dir:-$default_output_dir}

output_dir=$(expand_path "$output_dir")
mkdir -p "$output_dir" || exit 1

make_icon() {
  convert -background none -alpha on "$source" -resize "$1x$1" -gravity center -extent "${1}x${1}" -depth 8 "$2" || exit 1
}

make_icon 320 "$output_dir/screenshot_320x320.ico"
make_icon 192 "$output_dir/icon_192x192.ico"
make_icon 512 "$output_dir/icon_512x512.png"
make_icon 104 "$output_dir/logo.png"
make_icon 64 "$output_dir/favicon.ico"
make_icon 384 "$output_dir/favicon.png"
