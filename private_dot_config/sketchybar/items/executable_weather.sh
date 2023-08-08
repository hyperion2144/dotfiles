#!/usr/bin/env bash

POPUP_CLICK_SCRIPT="sketchybar --set weather popup.drawing=toggle"

weather_icon=(
	drawing=off
	icon.align=right
	background.padding_right=-15
	icon.padding_left=5
	icon.padding_right=5
	script="$PLUGIN_DIR/weather.sh"
	click_script="$POPUP_CLICK_SCRIPT"
	update_freq=60
	popup.align=right
)

weather_details=(
	drawing=off
	background.corner_radius=12
	padding_left=7
	padding_right=7
)

sketchybar --add item weather.icon right \
	--set weather.icon "${weather_icon[@]}" \
	\
	--add item weather.details popup.weather.icon \
	--set weather.details "${weather_details[@]}" \
	--subscribe weather.icon mouse.entered \
	mouse.exited \
	mouse.exited.global
