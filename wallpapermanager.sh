#!/bin/bash
dir=~/Wallpapers
names=wallpapers.txt
height=1080
if [[ -e "$names" && $(wc -l < "$names") -gt 0 ]]; then
	read -r file < "$names"
	sed -i '1d' "$names"
	IFS=', ' read -r x y < <(hyprctl cursorpos)
	swww img -t grow --transition-pos $x,$(($height - $y)) --transition-duration 1 "$file"
else
	find "$dir" | shuf > "$names"
	notify-send "Reshuffling wallpapers"
fi
