#!/bin/sh

notify_id=2595
icon="media-playback-start-symbolic"

get_metadata() {
  playerctl metadata --format "{{artist}} - {{title}}" 2>/dev/null
}

send_notification() {
  info="$1"
  dunstify -a "PLAYER" "🎶 $info" -r "$notify_id" -u normal -i "$icon"
}

play_pause() {
  playerctl play-pause
  info=$(get_metadata)
  [ -z "$info" ] && info="No se detecta ningún reproductor"
  send_notification "$info"
}

next() {
  playerctl next
  sleep 0.2
  send_notification "$(get_metadata)"
}

prev() {
  playerctl previous
  sleep 0.2
  send_notification "$(get_metadata)"
}

case "$1" in
  play-pause) play_pause ;;
  next) next ;;
  prev) prev ;;
esac
