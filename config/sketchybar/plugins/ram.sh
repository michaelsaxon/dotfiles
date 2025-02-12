#!/bin/bash

ramusage=$(ps x -o %mem | awk 'END { print s } { s += $1 }' | sed 's/\..*//')

sketchybar --set $NAME label="$ramusage%"

