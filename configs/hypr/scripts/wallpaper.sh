#!/bin/bash

HOUR=$(date +%H)
FILE_PATH=$0
FILE_DIR=$(dirname "$(readlink -f "$0")")

changeBg() {
    pkill swaybg
    
    if [ $HOUR -gt 18 ]; then
        swaybg -o \* -i $HOME/Imágenes/wallpapers/1144956.png -m fill &
    else
        swaybg -o \* -i $HOME/Imágenes/wallpapers/cropped-1920-1080-118303.jpg -m fill &
    fi
}

intervalo=10

while true; do
    changeBg
        
    sleep $((intervalo * 60))
done
