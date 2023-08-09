#!/bin/bash

MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

if [[ $MIC_VOLUME -eq 0 ]]; then
	osascript -e 'set volume input volume 25'
elif [[ $MIC_VOLUME -gt 0 ]]; then
	osascript -e 'set volume input volume 0'
fi

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
