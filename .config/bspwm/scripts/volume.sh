#!/bin/sh

get_volume() {
  pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -1
}

is_muted() {
  pactl get-sink-mute @DEFAULT_SINK@ | grep -q "yes"
}

down() {
  pactl set-sink-volume @DEFAULT_SINK@ -2%
  volume=$(get_volume)
  dunstify -a "VOLUME" "Volumen al $volume%" -h int:value:"$volume" -r 2593 -u normal
  canberra-gtk-play -i audio-volume-change -d "changevolume"
}

up() {
  pactl set-sink-volume @DEFAULT_SINK@ +2%
  volume=$(get_volume)
  dunstify -a "VOLUME" "Volumen al $volume%" -h int:value:"$volume" -r 2593 -u normal
  canberra-gtk-play -i audio-volume-change -d "changevolume"
}

mute() {
  if is_muted; then
    pactl set-sink-mute @DEFAULT_SINK@ 0
    dunstify -a "VOLUME" "UNMUTED" -r 2593 -u normal
  else
    pactl set-sink-mute @DEFAULT_SINK@ 1
    dunstify -a "VOLUME" "MUTED" -r 2593 -u normal
  fi
}

case "$1" in
  up) up;;
  down) down;;
  mute) mute;;
esac