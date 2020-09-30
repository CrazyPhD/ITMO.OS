#!/bin/bash

ps -Ao pid,command | tail -n +2 | grep "/sbin/" | awk '{print $1}' > 2_2.txt
