#!/usr/bin/env bash

# start wallpaper daemon
swww init &
# set wallpaper
swww img ~/Downloads/violet-waters.jpg &
nm-applet --indicator &
waybar &
dusnt
