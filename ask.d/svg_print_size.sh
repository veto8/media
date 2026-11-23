#!/bin/sh
# id: 6
# desc: SVG - print size

. "$(dirname "$0")/lib_path"

printf "  Identify file [svg.png]: "
read -r identify_file
identify_file=${identify_file:-svg.png}

identify_file=$(expand_path "$identify_file")

identify -format "%wx%h\n" "$identify_file" || exit 1
