#!/bin/bash

for pid in $(ps -Ao pid | tail -n +2); do
	f="/proc/"$pid
	ppid=$(grep -Ehsi "ppid:\s+(.+)" $f"/status" | grep -o "[0-9]\+")
	rtime=$(grep -Ehsi "se\.sum_exec_runtime(.+):\s+(.+)" $f/sched | awk '{print $3}')
	swtc=$(grep -Ehsi "nr_switches(.+):\s+(.+)" $f/sched | awk '{print $3}')
	if [ -z $ppid ]; then
		ppid=0
	fi
	if [ -z $rtime ] || [ -z $swtc ]; then
		ART=0
	else
		ART=$(echo "scale=5; $rtime/$swtc" | bc | awk '{printf "%f", $0}')
	fi
	#echo "ProcessID="$pid" : Parent_ProcessID="$ppid" : Average_Running_Time="$ART
	echo "$pid $ppid $ART"
done | sort -nk2 | awk '{print "ProcessID="$1" : Parent_ProcessID="$2" : Average_Running_Time="$3}' > 2_4.txt
