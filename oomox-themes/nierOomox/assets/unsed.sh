#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#dcd6bd/g' \
         -e 's/rgb(100%,100%,100%)/#3a372e/g' \
    -e 's/rgb(50%,0%,0%)/#3a372e/g' \
     -e 's/rgb(0%,50%,0%)/#cd664d/g' \
 -e 's/rgb(0%,50.196078%,0%)/#cd664d/g' \
     -e 's/rgb(50%,0%,50%)/#dcd6bd/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#dcd6bd/g' \
     -e 's/rgb(0%,0%,50%)/#1d1a12/g' \
	"$@"
