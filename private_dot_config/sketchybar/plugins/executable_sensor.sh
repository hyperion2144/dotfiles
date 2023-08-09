#!/usr/bin/env bash

CPU_TEMP=$(
	istats cpu temp | cut -f 2 -d ":" | sed 's/[[:space:]]//g' | cut -f 1 -d "."
)

GPU_TEMP=$(
	istats scan TG0D | cut -f 2 -d "=" | cut -f 1 -d "." | sed 's/[[:space:]]//g'
)

sketchybar -m --set sensor.cpu label="${CPU_TEMP}" icon.highlight=$(if [ "$CPU_TEMP" -gt "70" ]; then echo "on"; else echo "off"; fi) \
	--set sensor.gpu label="$GPU_TEMP" icon.highlight=$(if [ "$GPU_TEMP" -gt "70" ]; then echo "on"; else echo "off"; fi)
