#!/bin/bash

cur=1
mode="+"
#echo $mode > pipe0

tail -f pipe0 |
while true; do
	read line
	case $line in
		"+")
			mode="$line"
			echo "summation"
		;;
		"*")
			mode="$line"
			echo "multiplication"
		;;
		"QUIT")
		    	echo "quit"
	 		killall tail
			exit 0
		;;
		[0-9]*)
			case $mode in
				"+")
					cur=$(echo "${cur} + ${line}" | bc)
					echo $cur
				;;
				"*")
					cur=$(echo "${cur} * ${line}" | bc)
					echo $cur
				;;
			esac
		;;
		*)
			echo "Illegal option."
			killall tail
			exit 1
		;;		

	esac
done
