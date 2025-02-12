#!/bin/bash

source kanagawa.skbrcolors.sh

STATE="$(echo "$INFO" | jq -r '.state')"

output=$(./plugins/media_parse "$INFO")

set -o noglob
IFS=$'\n' args=($output)
set +o noglob

# args: state, title, album, artist, app
title="${args[1]}"
album="${args[2]}"
artist="${args[3]}"
app="${args[4]}"

if [ "${args[0]}" = "playing" ]; then
  sketchybar --set $NAME label="$artist: $title" drawing=on \
    sketchybar --set media_info drawing=on
  sketchybar --set media_icon drawing=on icon="$($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
  sketchybar --animate quadratic 30 --set media_icon icon.color=$WHITE icon.width="dynamic"
  sketchybar --animate quadratic 30 --set media_info background.border_color=$WHITE
  sketchybar --animate quadratic 30 --set $NAME label.color=$WHITE icon.color=$WHITE label.width="dynamic" icon.width="dynamic"
else
  sketchybar --animate quadratic 30 --set $NAME label.color=$WHITE icon.color=$WHITE label.width=0 icon.width=0
  sketchybar --animate quadratic 30 --set media_info background.border_color=$WHITE
  sketchybar --animate quadratic 30 --set media_icon icon.color=$WHITE icon.width=0
  sleep 1
  sketchybar --set $NAME drawing=off
  sketchybar --set media_icon drawing=off
  sketchybar --set media_info drawing=off
fi
