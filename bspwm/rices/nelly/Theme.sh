#!/usr/bin/env bash
#  ╔═╗╔═╗╔╦╗╔╗ ╦╔═╗  ╦═╗╦╔═╗╔═╗
#  ╔═╝║ ║║║║╠╩╗║║╣   ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╚═╝╚═╝╩ ╩╚═╝╩╚═╝  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for nelly
bspc config border_width 2
bspc config top_padding 5
bspc config bottom_padding 5
bspc config normal_border_color "#1e1d2f"
bspc config active_border_color "#1e1d2f"
bspc config focused_border_color "#cba6f7"
bspc config presel_feedback_color "#90ceaa"
bspc config left_padding 80
bspc config right_padding 5
bspc config window_gap 10

if pidof -q bspc; then
	pkill -9 bspc > /dev/null
fi

# Launch the bar and or eww widgets
eww -c $HOME/.config/bspwm/rices/nelly/bar open bar &
eww -c $HOME/.config/bspwm/rices/nelly/dashboard daemon &
polybar -q tray -c $HOME/.config/bspwm/rices/nelly/bar/polybar_tray.ini &
