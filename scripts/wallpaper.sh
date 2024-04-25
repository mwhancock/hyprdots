#!/bin/sh

swww query
if [ $? -eq 1 ] ; then
    swww-daemon
fi
swww img ~/Pictures/wallpaper/wallhaven-43rev3_1920x1080.png
