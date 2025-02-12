#!/bin/bash

source kanagawa.skbrcolors.sh

#if [ "$SENDER" = "mouse.clicked" ]; then
#sketchybar --animate linear 10 --set language background.color="0xAAFFFFFF" icon.color="0xFF000000" label.color="0xFF000000"
#  skhd -k "ctrl - space"
#  sketchybar --set language background.color="0xAAFFFFFF" icon.color="0xFF000000" label.color="0xFF000000"
#  sleep 0.1
#fi

# get language
input_raw_cmd='defaults read ~/Library/Preferences/com.apple.HIToolbox.plist'

is_en_us=$(eval $input_raw_cmd | tail -6 | grep U.S.)
is_ja_jp=$(eval $input_raw_cmd | tail -6 | grep inputmethod.Japanese)
is_zh_cn=$(eval $input_raw_cmd | tail -6 | grep inputmethod.SCIM)

# explicitly reporting the length and checking eq 0 is necessary instead of -n flag due to some weird bug with preceding spaces in ja
if [ "${#is_en_us}" -ne 0 ]; then
  echo "English condition"
  # keyboard method is english
  #langcode='English'
  langcode='EN'
  #langcode=🇺
  options=(
    #background.color=$BLUE
    background.color="0x00000000"
    label.y_offset=0
    label.color=$BLUE
    icon.color=$BLUE
    background.border_color=$BLUE
  )
  font="TX-02:Bold:16"
elif [ "${#is_ja_jp}" -ne 0 ]; then
  echo "Japanese condition"
  langcode='日'
  #langcode=🇯
  options=(
    #background.color=$DEFAULT
    label.y_offset=0
    label.color=$BRIGHTRED
    icon.color=$BRIGHTRED
    background.border_color=$BRIGHTRED
  )
  font="Hiragino Sans:W8:14"
elif [ ${#is_zh_cn} -ne 0 ]; then
  echo "Chinese condition"
  langcode='中'
  options=(
    #background.color=$YELLOW
    label.color=$YELLOW
    icon.color=$YELLOW
    background.border_color=$YELLOW
  )
  font="Hiragino Sans:W8:14"
else
  langcode='???'
  options=(
    #background.color=$BLACK
    icon.color=$WHITE
    label.color=$WHITE
  )
  label.font="Helvetica Neue:Condensed Bold:16"
fi

echo "setting language indicator to $langcode"
sketchybar --set language label="$langcode" label.font="$font"
#sketchybar --animate linear 30 --set language "${options[@]}"
sketchybar --set language "${options[@]}"
