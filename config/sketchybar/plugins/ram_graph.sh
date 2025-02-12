#!/bin/bash

#CRT_AMBER=FFB000
#
#graph_options_mouse=(
#        graph.color="0xFF$CRT_AMBER"
#        icon.color="0xAA$CRT_AMBER"
#        label.color="0xAA$CRT_AMBER"
#        background.color="0xCC000000"
#        label.drawing="on"
#        icon.drawing="off"
#)
#
#graph_options_nomouse=(
#        graph.color="0xFFFFFFFF"
#        icon.color="0xAAFFFFFF"
#        background.color="0x00000000"
#        label.drawing="off"
#        icon.drawing="on"
#)

source kanagawa.skbrcolors.sh

CRT_AMBER=FFB000

graph_options_mouse=(
  graph.color=$FG
  icon.color=$FG
  label.color=$FG
  background.color=$SELECTION
  label.drawing="on"
  icon.drawing="off"
)

graph_options_nomouse=(
  graph.color=$WHITE
  icon.color=$WHITE
  background.color="0x00000000"
  label.drawing="off"
  icon.drawing="on"
)

ramusage=$(ps x -o %mem | awk 'END { print s } { s += $1 }' | sed 's/\..*//')
echo $ramusage
ram_dec=$(echo $ramusage | awk '{print $1 / 100}')

echo $ram_dec

if [ "$SENDER" = "routine" ]; then
  sketchybar --push $NAME $ram_dec
elif [ "$SENDER" = "mouse.entered" ]; then
  sketchybar --set $NAME label="RAM $ramusage%" "${graph_options_mouse[@]}"
else
  sketchybar --set $NAME "${graph_options_nomouse[@]}"
fi
