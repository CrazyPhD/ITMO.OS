#!/bin/bash

#ps -o pid,time,stime | tail -n +2 | sort -rk3 | head -n 1 | awk '{print $1 ": " $3}'
ps aux | sort -nrk9 | head -1 | awk '{print $2 ": " $9}'



