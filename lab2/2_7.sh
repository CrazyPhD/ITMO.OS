#!/bin/bash

check() {
for x in $(ps -Ao pid,command | tail -n +2 | awk '{print $1":"$2}'); do
	pid=$(echo $x | awk -F ":" '{print $1}')
	cmd=$(echo $x | awk -F ":" '{print $2}')
	f="/proc/"$pid
	if [ -f $f/io ]; then
		rbytes=$(grep -h "read_bytes:" $f/io | sed "s/[^0-9]*//")
		echo "$pid $cmd $rbytes"
	fi
done | sort -nk1
}

check > 2_7_1.ps
sleep 1m
check > 2_7_2.ps

cat 2_7_1.ps |
while read str; do
        pid=$(awk '{print $1}' <<< $str)
        mem0=$(awk '{print $3}' <<< $str)
        cmd=$(awk '{print $2}' <<< $str)

        mem1=$(cat 2_7_2.ps | awk -v id="$pid" '{if ($1 == id) print $3}')
        memdiff=$(echo "$mem1-$mem0" | bc)
        echo $pid":"$cmd":"$memdiff
done | sort -t ':' -nrk3 | head -3

rm *.ps
