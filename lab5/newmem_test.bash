#!/bin/bash

for i in $(seq 1 $1); do
	sleep 1
	./newmem.bash $2&
done
