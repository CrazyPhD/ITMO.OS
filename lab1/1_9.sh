#!/bin/bash

find /var/log/* -name '*.log' | xargs wc -l | sort -nr | head -n 1 | awk '{print "Total lines count:", $1}'
