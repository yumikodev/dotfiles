#!/bin/bash

screenshots_dir="$HOME/Imágenes/Screenshots"

if [ ! -d "$screenshots_dir" ]; then
    mkdir -p "$screenshots_dir"
fi

grimshot save area $HOME"/Imágenes/Screenshots/screenshot_"$(date +"%Y-%m-%d_%H-%M-%S")".png"