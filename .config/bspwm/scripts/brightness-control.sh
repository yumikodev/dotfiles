#!/bin/sh

notify_id=2594
step="5%"

get_brightness() {
  brightnessctl | grep -oP '\(\K[0-9]+(?=%)'
}

send_notification() {
  brightness="$1"
  dunstify -a "BRIGHTNESS" "Brillo al $brightness%" -h int:value:"$brightness" -r "$notify_id" -u normal -i display-brightness-symbolic
}

down() {
  brightnessctl set "$step-"
  send_notification "$(get_brightness)"
}

up() {
  brightnessctl set "+$step"
  send_notification "$(get_brightness)"
}

case "$1" in
  up) up ;;
  down) down ;;
esac
