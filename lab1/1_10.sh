#!/bin/bash

man bash | sed 's/\s/\n/g' | sort | uniq -c | sort -nr | awk 'length($2) > 3 {print $2}' | head -3
