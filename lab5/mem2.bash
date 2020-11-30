#!/bin/bash

array=()
part=(1 2 3 4 5 6 7 8 9 10)
c=0
echo "" > report2.log

while true; do
	array+=(${part[@]})
	let c++
	if [[ $c == 100000 ]]; then
		echo "[2] ${#array[@]}"
		c=0
		echo "${#array[@]}" >> report2.log
	fi
done
