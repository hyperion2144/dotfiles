#!/usr/bin/env bash
#disk.sh

sketchybar -m --set "$NAME" label="$(df -H | grep -E '^(/dev/disk1s1).' | awk '{ printf ("%s\n", $5) }')"
