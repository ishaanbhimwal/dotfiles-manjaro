#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# start dwm-bar
$HOME/scripts/dwm-bar/dwm_bar.sh &

# start notification daemon
dunst &

# start imwheel
imwheel &

# enable numlock
numlockx on &

# set brightness
xbacklight -set 60 &

# set wallpaper
xwallpaper --zoom $HOME/Pictures/wallpapers/illyria-default.jpg &

# start clipboard daemon
clipmenud &

# enable battery alert
$HOME/scripts/battery_alert &

# start compositor
picom -b &

# lock screen after a few minutes of inactivity
xautolock -time 10 -locker "systemctl suspend" -detectsleep &

# start redshift
redshift &

# start polkit agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# start secret storage service
/usr/bin/gnome-keyring-daemon --start --components=secrets &

# launch dwm
exec $HOME/scripts/dwm_start
