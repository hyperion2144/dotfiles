#!/usr/bin/env bash

mic_icon=(
	icon.font="$NERD_FONT:Bold:16.0"
)

sketchybar -m --add item mic right \
	--set mic update_freq=3 \
	--set mic "${mic_icon[@]}" \
	--set mic script="~/.config/sketchybar/plugins/mic.sh" \
	--set mic click_script="~/.config/sketchybar/plugins/mic_click.sh"
