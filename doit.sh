#!/bin/bash
./01_convertgz switzerland-latest
./02_convertformat switzerland-latest
./03_dropauthor switzerland-latest
./04_filtero5m switzerland-latest
./05_converttoshp switzerland-latest
./zz_packup
./zz_test
