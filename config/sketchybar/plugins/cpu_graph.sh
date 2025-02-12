#!/bin/bash

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

CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)
CPU_INFO=$(ps -eo pcpu,user)
CPU_SYS=$(echo "$CPU_INFO" | grep -v $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
CPU_USER=$(echo "$CPU_INFO" | grep $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")

CPU_FLOAT="$(echo "$CPU_SYS $CPU_USER" | awk '{print ($1 + $2)}')"

if [ "$SENDER" = "routine" ]; then
  sketchybar --push $NAME $CPU_FLOAT
elif [ "$SENDER" = "mouse.entered" ]; then
  CPU_PERCENT="$(echo "$CPU_FLOAT" | awk '{printf "%.0f", ($1*100)}')"
  sketchybar --set $NAME label="CPU $CPU_PERCENT%" "${graph_options_mouse[@]}"
else
  sketchybar --set $NAME "${graph_options_nomouse[@]}"
fi
