#!/bin/bash

./3_6_proc.sh&pid=$!
./3_6_gen.sh $pid

