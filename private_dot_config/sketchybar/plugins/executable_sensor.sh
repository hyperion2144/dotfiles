#!/usr/bin/env bash

CPU_TEMP=$(
	istats cpu temp | cut -f 2 -d ":" | sed 's/[[:space:]]//g' | cut -f 1 -d "."
)

GPU_TEMP=$(
	istats scan TG0D | cut -f 2 -d "=" | cut -f 1 -d "." | sed 's/[[:space:]]//g'
)

if [ "$CPU_TEMP" -eq "0" ]; then
	sketchybar -m --set sensor.cpu drawing=off \
		--set sensor.gpu drawing=off
else
	sketchybar -m --set sensor.cpu drwaing=on label="${CPU_TEMP}" icon.highlight=$(if [ "$CPU_TEMP" -gt "70" ]; then echo "on"; else echo "off"; fi) \
		--set sensor.gpu drwaing=on label="$GPU_TEMP" icon.highlight=$(if [ "$GPU_TEMP" -gt "70" ]; then echo "on"; else echo "off"; fi)

fi
