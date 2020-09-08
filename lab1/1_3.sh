#!/bin/bash

echo -e "Menu options:\n1. Launch nano\n2. Launch vi\n3. Launch Links browser\n4. Exit"
read opt
if [[ opt -eq 1 ]]
then
    nano
elif [[ opt -eq 2 ]]
then
    vi
elif [[ opt -eq 3 ]]
then
    links
elif [[ opt -eq 4 ]]
then
    exit
else
    echo "Incorrect menu option."
fi
