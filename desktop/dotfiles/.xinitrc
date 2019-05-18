#!bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
export PATH=$HOME/bin:/usr/local/bin:$PATH

# test
#export GTK_IM_MODULE=fcitx
#export QT_IM_MODULE=fcitx
#export XMODIFIERS=@im=fcitx
#fcitx &
numlockx &

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
xset +fp ~/.local/share/fonts
xset fp rehash

setxkbmap -option caps:ctrl_modifier
xsetroot -cursor_name left_ptr

# Monitor Calibration
xcalib -d :0 ~/.config/dell.icc

# Autostart
feh --bg-fill /mnt/windows/Wallpapers/bluelink.png
mpd &

# Session
exec herbstluftwm
