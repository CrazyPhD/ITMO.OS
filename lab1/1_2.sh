#!/bin/bash
s=""
text=""
read s
if [ $s == 'q' ]
then
    echo "Not a single line was entered."
    exit
fi
while [ $s != 'q' ]
do
   text="${text}${s}|"
   read s
done
echo ${text::-1}
