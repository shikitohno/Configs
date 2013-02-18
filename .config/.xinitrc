#! /bin/bash

xrdb -merge ~/.Xresources
xscreensaver -no-splash &
xsetroot -cursor_name left_ptr &
setxkbmap no &
xcompmgr -c &
exec xmonad
