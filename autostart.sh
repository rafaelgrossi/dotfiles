#!/bin/bash

wallpaper=violet

dunst &
nm-applet &
redshift &


if [[ "$wallpaper" = "inori" ]]; then
	feh --bg-fill /home/raech/Pictures/Wallpaper/inori.png
	tint2 -c ~/.config/tint2/tint2rc-bat-redcircle &
	tint2 -c ~/.config/tint2/tint2rc-clock-redcircle &
	tint2 -c ~/.config/tint2/tint2rc-ws-redcircle &
elif [[ "$wallpaper" = "violet" ]]; then
	feh --bg-fill /home/raech/Pictures/Wallpaper/violet.jpg
	tint2 -c ~/.config/tint2/tint2rc-bat-circle &
	tint2 -c ~/.config/tint2/tint2rc-clock-circle &
	tint2 -c ~/.config/tint2/tint2rc-ws-circle &
fi

libinput-gestures &
