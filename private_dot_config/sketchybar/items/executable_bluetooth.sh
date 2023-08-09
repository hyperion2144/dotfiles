#!/usr/bin/env sh

sketchybar --add alias "控制中心,Bluetooth" right \
	--rename "控制中心,Bluetooth" bluetooth_alias \
	--set bluetooth_alias icon.drawing=off \
	label.drawing=off \
	alias.color="$ORANGE" \
	background.padding_right=-5 \
	background.padding_left=-5 \
	align=right \
	click_script="$PLUGIN_DIR/bluetooth_click.sh"
