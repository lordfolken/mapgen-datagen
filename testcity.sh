#!/bin/bash
if [ -z "$1" ]; then
  echo specify file without extension
  exit 1
fi
./04_filtero5m $1
./05_converttoshp $1
./05_reduceshp $1
./zz_packup $1
./zz_test
