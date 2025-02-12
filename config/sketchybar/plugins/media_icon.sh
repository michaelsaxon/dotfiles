#!/bin/bash
STATE="$(echo "$INFO" | jq -r '.state')"

output=$(./plugins/media_parse "$INFO")

set -o noglob
IFS=$'\n' args=($output)
set +o noglob

# args: state, title, album, artist, app
app="${args[4]}"

if [ "${args[0]}" = "playing" ]; then
  sketchybar --set $NAME drawing=on icon="$($CONFIG_DIR/plugins/icon_map_fn.sh "$app")" 
  sketchybar --animate quadratic 30 --set $NAME icon.color="0xFFFFFFFF" icon.width="dynamic" \
else
  sketchybar --animate quadratic 30 --set $NAME icon.color="0x00FFFFFF" icon.width=0
  sleep 1
  sketchybar --set $NAME drawing=off 
fi

