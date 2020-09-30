#!/bin/bash

ps aux | awk '{if ($6 != 0) print $2" "$6" "$11}' | sort -nk1 | tail -n +2 | head -n -6 > 2_7_1.ps
sleep 1m
ps aux | awk '{if ($6 != 0) print $2" "$6" "$11}' | sort -nk1 | tail -n +2 | head -n -6 > 2_7_2.ps

cat 2_7_1.ps |
while read str; do
	pid=$(awk '{print $1}' <<< $str)
	mem0=$(awk '{print $2}' <<< $str)
	cmd=$(awk '{print $3}' <<< $str)

	mem1=$(cat 2_7_2.ps | awk -v id="$pid" '{if ($1 == id) print $2}')
	memdiff=$(echo "$mem1-$mem0" | bc)
	echo $pid":"$cmd":"$memdiff
done | sort -t ':' -nrk3 | head -3

rm *.ps
