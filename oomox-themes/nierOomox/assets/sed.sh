#!/bin/sh
sed -i \
         -e 's/#dcd6bd/rgb(0%,0%,0%)/g' \
         -e 's/#3a372e/rgb(100%,100%,100%)/g' \
    -e 's/#3a372e/rgb(50%,0%,0%)/g' \
     -e 's/#cd664d/rgb(0%,50%,0%)/g' \
     -e 's/#dcd6bd/rgb(50%,0%,50%)/g' \
     -e 's/#1d1a12/rgb(0%,0%,50%)/g' \
	"$@"
