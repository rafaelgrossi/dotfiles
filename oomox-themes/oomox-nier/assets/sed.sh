#!/bin/sh
sed -i \
         -e 's/#b7b29d/rgb(0%,0%,0%)/g' \
         -e 's/#3c3828/rgb(100%,100%,100%)/g' \
    -e 's/#3c3828/rgb(50%,0%,0%)/g' \
     -e 's/#cd664d/rgb(0%,50%,0%)/g' \
     -e 's/#b7b29d/rgb(50%,0%,50%)/g' \
     -e 's/#3c3828/rgb(0%,0%,50%)/g' \
	"$@"
