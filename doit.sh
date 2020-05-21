#!/bin/bash
if [ -z "$1" ]; then
  echo specify file without extension
  exit 1
fi
./01_convertgz $1
./02_convertformat $1
./03_dropauthor $1
./04_filtero5m $1
./05_converttoshp $1
./zz_packup
./zz_test
