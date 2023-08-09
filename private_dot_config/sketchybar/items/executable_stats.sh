#!/usr/bin/env bash
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

cpu_percent=(
	label.font="$FONT:Heavy:12"
	label=CPU%
	label.color="$TEXT"
	icon="$CPU"
	icon.color="$BLUE"
	update_freq=2
	mach_helper="$HELPER"
)

sketchybar --add item cpu.percent right \
	--set cpu.percent "${cpu_percent[@]}"

memory=(label.font="$FONT:Heavy:12"
	label.color="$TEXT"
	icon="$MEMORY"
	icon.font="$FONT:Bold:16.0"
	icon.color="$GREEN"
	update_freq=15
	script="$PLUGIN_DIR/ram.sh"
)

sketchybar --add item memory right \
	--set memory "${memory[@]}"

disk=(
	label.font="$FONT:Heavy:12"
	label.color="$TEXT"
	icon="$DISK"
	icon.color="$MAROON"
	update_freq=60
	script="$PLUGIN_DIR/disk.sh"
)

sketchybar --add item disk right \
	--set disk "${disk[@]}"

sensor_cpu=(
	drawing=off
	y_offset=-7
	label.font="$FONT:Heavy:10"
	label.color="$TEXT"
	icon="cpu"
	icon.font="$NERD_FONT:Bold:10.0"
	icon.color="$GREEN"
	icon.highlight_color="$RED"
	update_freq=1
)

sensor_gpu=(
	drawing=off
	background.padding_right=-45
	y_offset=7
	label.font="$FONT:Heavy:10"
	label.color="$TEXT"
	icon="gpu"
	icon.font="$NERD_FONT:Bold:10.0"
	icon.color="$GREEN"
	icon.highlight_color="$RED"
	update_freq=1
	script="$PLUGIN_DIR/sensor.sh"
)

sketchybar --add item sensor.cpu right \
	--set sensor.cpu "${sensor_cpu[@]}" \
	--add item sensor.gpu right \
	--set sensor.gpu "${sensor_gpu[@]}"

network_down=(
	y_offset=-7
	label.font="$FONT:Heavy:10"
	label.color="$TEXT"
	icon="$NETWORK_DOWN"
	icon.font="$NERD_FONT:Bold:16.0"
	icon.color="$GREEN"
	icon.highlight_color="$BLUE"
	update_freq=1
)

network_up=(
	background.padding_right=-62
	y_offset=7
	label.font="$FONT:Heavy:10"
	label.color="$TEXT"
	icon="$NETWORK_UP"
	icon.font="$NERD_FONT:Bold:16.0"
	icon.color="$GREEN"
	icon.highlight_color="$BLUE"
	update_freq=1
	script="$PLUGIN_DIR/network.sh"
)

sketchybar --add item network.down right \
	--set network.down "${network_down[@]}" \
	--add item network.up right \
	--set network.up "${network_up[@]}"

separator_right=(
	icon=
	icon.font="$NERD_FONT:Regular:16.0"
	background.padding_left=10
	background.padding_right=15
	label.drawing=off
	click_script='sketchybar --trigger toggle_stats'
	icon.color="$TEXT"
)

sketchybar --add item separator_right right \
	--set separator_right "${separator_right[@]}"

sketchybar --add event hide_stats \
	--add event show_stats \
	--add event toggle_stats \
	\
	--add item animator right \
	--set animator drawing=off \
	updates=on \
	script="$PLUGIN_DIR/toggle_stats.sh" \
	--subscribe animator hide_stats show_stats toggle_stats
