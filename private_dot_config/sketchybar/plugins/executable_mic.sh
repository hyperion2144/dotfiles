#!/bin/bash

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

ICON=

if [[ $MIC_VOLUME -eq 0 ]]; then
	ICON=
	sketchybar -m --set mic icon=
elif [[ $MIC_VOLUME -gt 0 ]]; then
	ICON=
fi

sketchybar --set $NAME icon="$ICON"
