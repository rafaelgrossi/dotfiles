#!/usr/bin/env bash

## run (only once) processes which spawn with the same name
function run {
   if (command -v $1 && ! pgrep $1); then
     $@&
   fi
}

## run (only once) processes which spawn with different name
if (command -v gnome-keyring-daemon && ! pgrep gnome-keyring-d); then
    gnome-keyring-daemon --daemonize --login &
fi
if (command -v start-pulseaudio-x11 && ! pgrep pulseaudio); then
    start-pulseaudio-x11 &
fi
if (command -v /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 && ! pgrep polkit-mate-aut) ; then
    /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
fi
if (command -v  xfce4-power-manager && ! pgrep xfce4-power-man) ; then
    xfce4-power-manager &
fi
# System-config-printer-applet is not installed in minimal edition
if (command -v system-config-printer-applet && ! pgrep applet.py ); then
  system-config-printer-applet &
fi

run nm-applet
run compton --config ~/.config/compton/compton.conf
run dunst
run firefox
run thunderbird
#run redshift -c ~/.config/redshift/redshift.conf
#run compton --shadow-exclude '!focused'
#run pamac-tray
#run battery_daemon

setxkbmap -option caps:ctrl_modifier
setxkbmap -layout us,us -variant ,intl -option grp:alt_shift_toggle

# Raech
#run mpd ~/.config/mpd/mpd.conf
#if [ ! -e /tmp/mpv.fifo ]; then
#    mkfifo /tmp/mpv.fifo
#fi
