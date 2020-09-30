#!/bin/bash

ppid_0="0"
ARTSUM="0"
COUNT="0"
AVG="0"

echo -e "$(<2_4.txt)\n" | sed "s/[^0-9.]\+/ /g" | sed "s/^ //g" |
while read str; do
	pid=$(awk '{print $1}' <<< $str)
	ppid=$(awk '{print $2}' <<< $str)
	ART=$(awk '{print $3}' <<< $str)
	if [[ $ppid == $ppid_0 ]]; then
		ARTSUM=$(echo "$ARTSUM+$ART" | bc | awk '{printf "%f", $0}')
		COUNT=$(($COUNT+1))
	else
		AVG=$(echo "scale=5; $ARTSUM/$COUNT" | bc | awk '{printf "%f", $0}')
		echo "Average_Children_Running_Time_of_ParentID="$ppid_0" is "$AVG
		ARTSUM=$ART
		COUNT=1
		ppid_0=$ppid
	fi
	if [[ ! -z $pid ]]; then
		echo "ProcessID="$pid" : Parent_ProcessID="$ppid" : Average_Running_Time="$ART
	fi
done > 2_5.txt

