#!/bin/bash
if [ -z "$1" ]; then
  echo specify file without extension
  exit 1
fi
#rm -rf workdir/"$1"
set -e 
#./01_convertgz $1
#./02_convertformat $1
echo '### DROPAUTHOR'
#./03_dropauthor $1
echo '### FILTERo5m'
#./04_filtero5m $1
echo '### CONVERTTOSHP'
./05_converttoshp $1
echo '### READSHP'
./06_readshape $1
echo '### REDUCESHP'
./07_reduceshp $1
echo '### PACKING'
./zz_packup $1
