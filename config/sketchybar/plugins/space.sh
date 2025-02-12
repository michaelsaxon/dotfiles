#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

SPACE_ICONS=("󰎦" "󰎩" "󰎬" "󰎮" "󰎰" "󰎵" "󰎸" "󰎻" "󰎾" "󰽾")
SPACE_ICONS_SELECTED=("󰎤" "󰎧" "󰎪" "󰎭" "󰎱" "󰎳" "󰎶" "󰎹" "󰎼" "󰽽")

num=$((${NAME#*.} - 1))

if [ "$SELECTED" = true ]; then
	icon=${SPACE_ICONS_SELECTED[num]}
else
	icon=${SPACE_ICONS[num]}
fi

sketchybar --set "$NAME" icon=$icon
