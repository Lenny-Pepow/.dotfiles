#! /bin/sh

file=$(yazi --chooser-file=/dev/stdout | while read -r; do printf "%q " "$REPLY"; done)

dipc catppuccin -s mocha --dir-output ~/Pictures/wallpapers/catppuccin $file
