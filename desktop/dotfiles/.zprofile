if [[ ! $DISPLAY && "$(tty)" = "/dev/tty1" ]]; then
	exec startx
fi
