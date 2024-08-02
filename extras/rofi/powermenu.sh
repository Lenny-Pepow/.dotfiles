#! /bin/sh


prompt=U$(fastfetch | grep Uptime | cut -d 'U' -f 2)
which=$(printf "Power Off\nRestart\nLock" | rofi -dmenu -i -p "$prompt")

case "$which" in
	"Power Off") poweroff ;;
	"Restart") reboot ;;
	"Lock") (lock function here) ;;
	*) exit 1 ;;
esac
