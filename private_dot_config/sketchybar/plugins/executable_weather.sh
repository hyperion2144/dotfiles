#!/bin/bash

API_KEY="d9ea79eba35ff0c1862091d42cbf2b03" # insert api key here
CITY=$(curl -s "https://restapi.amap.com/v3/ip?key=${API_KEY}" | jq -r '.adcode')

# first comment is description, second is icon number

data=$(curl -s "https://restapi.amap.com/v3/weather/weatherInfo?key=$API_KEY&city=$CITY")
weather=$(echo "$data" | jq -r '.lives[0].weather')
temp=$(echo "$data" | jq -r '.lives[0].temperature')

sketchybar --set "$NAME" \
	icon="$weather" \
	label="${temp}°C" \
	drawing=on
