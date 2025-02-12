#!/bin/bash

YPAD_BONUS=$(cat ~/.config/yabai/ypad_bonus)

if [[ "$YPAD_BONUS" == 0 ]]; then
	echo "zero case"
	echo 40 > ~/.config/yabai/ypad_bonus
	yabai --restart-service
else
	echo "else case"
	echo 0 > ~/.config/yabai/ypad_bonus
	yabai --restart-service
fi
