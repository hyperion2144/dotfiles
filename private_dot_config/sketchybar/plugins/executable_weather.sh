#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"

render_bar() {
	sketchybar --set weather.icon icon="${icon}" \
		--set weather.icon drawing=on
}

render_popup() {
	sketchybar --remove '/weather.details.\.*/'

	COUNTERR=0
	for line in "${popup_weather[@]}"; do
		weather_line=(
			label="$line"
			label.font="$FONT:Bold:12.0"
			label.drawing=on
			click_script="sketchybar --set $NAME popup.drawing=off"
			drawing=on
		)
		item=weather.details."$COUNTERR"

		sketchybar --add item "$item" popup.weather.icon
		sketchybar --set "$item" "${weather_line[@]}"

		COUNTERR=$((COUNTERR + 1))
	done
}

update() {
	# Bar
	ip=$(curl -s -4 cip.cc | grep IP | cut -f 2 -d ":" | cut -f 2 -d " ")
	url="https://wttr.in/$ip?format=%c%t&lang=zh"
	icon=$(curl -s "$url" | sed 's/  */ /g')

	# popup
	url="https://wttr.in/$ip?T&lang=zh"
	IFS=$'\n'
	popup_weather=($(curl -s "$url"))
	IFS=$OIFS

	render_bar
	render_popup

	if [ "$COUNT" -ne "$PREV_COUNT" ] 2>/dev/null || [ "$SENDER" = "forced" ]; then
		sketchybar --animate tanh 15 --set "$NAME" label.y_offset=5 label.y_offset=0
	fi
}

popup() {
	sketchybar --set "$NAME" popup.drawing="$1"
}

case "$SENDER" in
"routine" | "forced")
	update
	;;
"mouse.entered")
	popup on
	;;
"mouse.exited" | "mouse.exited.global")
	popup off
	;;
"mouse.clicked")
	popup toggle
	;;
esac
