#!bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

wallpaper=catwallpaper.mp4

# test
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx &

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap $usermodmap
fi

# Raech Settings

xset +fp /usr/share/fonts/
xset +fp ~/.fonts/misc/
xset fp rehash

xrandr --output eDP1 --dpi 160
setxkbmap -option caps:ctrl_modifier
setxkbmap -layout us,us -variant ,intl -option grp:alt_shift_toggle
xsetroot -cursor_name left_ptr

# Session
session=2bwm
if [ $session = "dwm"]; then
	gifwp ~/Pictures/Wallpaper/$wallpaper
	sh ~/Suckless/Taylan/autostart.sh
	exec dwm
fi
if [ $session = "awesome" ]; then
	exec awesome
fi
if [ $session = "2bwm" ]; then
	#gifwp ~/Pictures/Wallpaper/$wallpaper
	sh ~/Suckless/2bwm/autostart.sh
	exec ~/Suckless/2bwm/2bwm
fi
#gifwp ~/Pictures/Wallpaper/$wallpaper
#exec dwm
