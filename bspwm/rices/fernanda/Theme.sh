#!/usr/bin/env bash

# Set bspwm configuration for fernanda
bspc config border_width 2
bspc config top_padding 40
bspc config bottom_padding 5
bspc config normal_border_color "#1e1d2f"
bspc config active_border_color "#1e1d2f"
bspc config focused_border_color "#cba6f7"
bspc config presel_feedback_color "#7aa2f7"
bspc config left_padding 5
bspc config right_padding 5
bspc config window_gap 10

# Launch the bar
eww -c $HOME/.config/bspwm/rices/fernanda/widgets daemon &
polybar -q fer1 -c $HOME/.config/bspwm/rices/fernanda/config.ini &
polybar -q fer2 -c $HOME/.config/bspwm/rices/fernanda/config.ini &
polybar -q fer3 -c $HOME/.config/bspwm/rices/fernanda/config.ini &
polybar -q fer4 -c $HOME/.config/bspwm/rices/fernanda/config.ini &
