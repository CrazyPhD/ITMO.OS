#!/bin/bash

./3_4_a.sh&pid0=$!
./3_4_a.sh&pid1=$!
./3_4_a.sh&pid2=$!

renice +10 -p $pid0

at now + 1 minute <<< "kill ${pid2}"
at now + 2 minute <<< "kill ${pid0} ; kill ${pid1}"
