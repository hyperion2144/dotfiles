#!/usr/bin/env bash

weather_icon=(
	drawing=off
	icon.align=right
	background.padding_right=-15
	icon.padding_left=5
	icon.padding_right=5
	script="$PLUGIN_DIR/weather.sh"
	click_script="open -a Weather"
	update_freq=60
	popup.align=right
)

sketchybar --add item weather.icon right \
	--set weather.icon "${weather_icon[@]}"
