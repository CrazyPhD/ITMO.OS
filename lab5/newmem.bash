#!/bin/bash

array=()
part=(1 2 3 4 5 6 7 8 9 10)

while true; do
	array+=(${part[@]})
	if [ "${#array[@]}" -gt "$1" ]; then
		break
	fi
done
