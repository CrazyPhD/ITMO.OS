#!/bin/bash

mkfifo pipe0

./3_5_proc.sh&
./3_5_gen.sh

rm pipe0
