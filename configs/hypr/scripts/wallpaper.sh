#!/bin/bash

HOUR=$(date +%H)

setInterval() {
	local func=$1
	local sleeptime=$2
	local _start _end _delta _sleep
	while true; do
		_start=$(date +%s)
		#echo "$_start: starting work"

		# do work (unknown amount of time)
		"$func"

		_end=$(date +%s)
		_delta=$((_end - _start))
		_sleep=$((sleeptime - _delta))
		#echo "$_end: finished doing work, took $_delta seconds, sleeping for $_sleep seconds"
		sleep "$_sleep"
	done
}

changeBg() {
  if [ $HOUR -gt 18 ]; then
    swaybg -o \* -i $HOME/Imágenes/wallpapers/Monterey_Abstract_night.jpg -m fill
  else
    swaybg -o \* -i $HOME/Imágenes/wallpapers/Monterey_Abstract_day.jpg -m fill
  fi
}

setInterval changeBg 10
