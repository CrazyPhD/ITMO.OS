#!/bin/bash

curdate=$(date '+%d.%m.%y_%H:%M:%S')

mkdir ~/test && { echo "catalog test was created successfully" > ~/report ; touch ~/test/$curdate ; }
ping -c1 www.net_nikogo.ru || echo "${curdate} ping error" >> ~/report
