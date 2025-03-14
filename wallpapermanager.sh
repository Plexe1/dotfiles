#!/bin/bash
dir=~/Wallpapers
names=wallpapers.txt
height=1080
if [ -e $names -a $(wc -l $names |  cut -c1) -gt 0 ]; then
	read -r file < $names
	sed -i '1d' $names
	IFS=', ' read -r x y < <(hyprctl cursorpos)
	swww img -t grow --transition-pos $x,$(($height - $y)) --transition-duration 1 $dir/$file
else
	echo "$(ls $dir | shuf)" > "$names"
fi
