#! /bin/sh

swww img ~/Pictures/wallpapers/catppuccin/$(eza -f -i ~/Pictures/wallpapers/catppuccin/ | shuf -n 1) -t grow --transition-pos 0.5,1.0 --transition-step 1 &

mpv ~/SoundVideoPack/Noita/button_select.wav
