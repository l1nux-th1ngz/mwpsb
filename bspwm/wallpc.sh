#!/bin/bash

WALLPAPER_DIR="$HOME/.local/share/wallpapers"
autorandr --change
sleep 2
IFS=$'\n' read -rd '' -a MONITORS < <(xrandr | grep " connected" | cut -d" " -f1)
for i in "${!MONITORS[@]}"; do
    RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
    feh --no-fehbg --bg-scale "$RANDOM_WALLPAPER" --screen "$i"
done
while true; do
    sleep 284
    autorandr --change
    sleep 2
    for i in "${!MONITORS[@]}"; do
        RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
        feh --no-fehbg --bg-scale "$RANDOM_WALLPAPER" --screen "$i"
    done
done
