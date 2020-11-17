#!/bin/bash
if [ -z "$1" ]; then
  echo specify file without extension
  exit 1
fi
./05_converttoshp $1
./06_reduceshp $1
./zz_packup $1
#./zz_test $1
