#!/bin/bash

find /var/log/* -name '*.log' 2>/dev/null | xargs wc -l 2>/dev/null | sort -nr | head -n 1 | awk '{print "Total lines count:", $1}'
