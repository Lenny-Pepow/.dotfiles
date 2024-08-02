#! /bin/sh
wl-copy $(grep -v '^#' ~/.dotfiles/extras/bookmarks | rofi -p '[Q.Q]' -i -l 12 -dmenu | cut -d ' ' -f 1)

#This is a bash script that runs rofi to copy my bookmarks.
#How it works:
#it runs everything inside the parenthesis before, then copy it with wl-copy;
#i extract everything inside my bookmarks file and sent it to rofi to select one;
#once selected, cut deletes everything after any spaces; (I do it to write comments to find what i want easier)
#only then the bookmark is copied.
