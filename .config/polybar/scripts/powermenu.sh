#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="~/.config/polybar/scripts/rofi"
uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -no-config -theme $dir/powermenu.rasi"

# Options
shutdown=" Apagar"
reboot=" Reiniciar"
lock=" Bloquear"
suspend=" Suspender"
logout=" Salir"
yes='Si'
no='No'

# Confirmation
confirm_exit() {
	echo -e "$yes\n$no" | rofi \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-mesg '¿Estás seguro?' \
		-theme $dir/confirm.rasi
}

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "Activo: $uptime" -dmenu -selected-row 0)"
case $chosen in
$shutdown)
	ans=$(confirm_exit &)
	if [[ $ans == $yes ]]; then
		systemctl poweroff
	elif [[ $ans == $no ]]; then
		exit 0
	fi
	;;
$reboot)
	ans=$(confirm_exit &)
	if [[ $ans == $yes ]]; then
		systemctl reboot
	elif [[ $ans == $no ]]; then
		exit 0
	fi
	;;
$lock)
	if [[ -f /usr/bin/i3lock ]]; then
		betterlockscreen -l dim
	elif [[ -f /usr/bin/betterlockscreen ]]; then
		betterlockscreen -l
	fi
	;;
$suspend)
	ans=$(confirm_exit &)
	if [[ $ans == $yes ]]; then
		mpc -q pause
		amixer set Master mute
		systemctl suspend
	elif [[ $ans == $no ]]; then
		exit 0
	fi
	;;
$logout)
	ans=$(confirm_exit &)
	if [[ $ans == $yes ]]; then
		if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
			openbox --exit
		elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
			bspc quit
		elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
			i3-msg exit
		fi
	elif [[ $ans == $no ]]; then
		exit 0
	fi
	;;
esac
