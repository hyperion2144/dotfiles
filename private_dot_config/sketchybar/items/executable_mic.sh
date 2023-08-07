#!/usr/bin/env bash

mic=(
	icon=
	icon.font="$NERD_FONT:Bold:16.0"
	script="$PLUGIN_DIR/mic.sh"
	click_script="$PLUGIN_DIR/mic_click.sh"
)

sketchybar --add item mic right \
	--set mic "${mic[@]}"
