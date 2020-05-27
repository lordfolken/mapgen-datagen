#!/bin/bash
v.in.ogr -t input=./ layer=$1_line output=$1_line1
v.generalize input=$1_line1 output=$1_line_reduced method=douglas_reduction threshold=0 reduction=30

v.in.ogr -t input=./ layer=$1_area output=$1_area1
v.generalize input=$1_area1 output=$1_area_reduced method=douglas_reduction threshold=0 reduction=30
