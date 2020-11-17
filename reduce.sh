#!/bin/bash -x

export LC_ALL=en_US.utf8

case "$( basename $0 )" in
  read_line.sh)
g.remove type=vector name=$1_line1,$1_line2,$1_line3,$1_line4,$1_line5,$1_line6
v.in.ogr -t input=./ layer=$1_line output=$1_line1
;;
  reduce_line.sh) 
v.generalize input=$1_line1 output=$1_line2 method=douglas threshold=0.0002 --overwrite
#v.build.polylines input=$1_line2 output=$1_line3
#v.clean input=$1_line1 output=$1_line2 tool=snap,break,rmdupl,rmbridge,rmdangle thres=0.002
v.clean input=$1_line2 output=$1_line3 tool=rmdupl,rmbridge,rmdangle thres=0.002 --overwrite
v.out.ogr input=$1_line3 type=line output=$2/$1_line_redux.shp format=ESRI_Shapefile
  ;;
  read_area.sh)
g.remove type=vector name=$1_area1,$1_area2,$1_area3,$1_area4,$1_area5,$1_area6
v.in.ogr -t input=./ layer=$1_area output=$1_area1 snap=1e-03
  ;;
  reduce_area.sh) 
#v.build.polylines input=$1_area1 output=$1_area2
v.clean input=$1_area1 output=$1_area2 tool=rmdangle,rmsa,rmdupl,rmbridge --verbose --overwrite
#v.generalize input=$1_area2 output=$1_area3 method=network threshold=100
v.dissolve input=$1_area3 output=$1_area4 --overwrite
#v.clean input=$1_area4 output=$1_area5 tool=rmarea threshold=100000
#v.edit map=$1_area1 type=boundary tool=delete query=length thresh=0,0,-0.5
#v.clean input=$1_area5 output=$1_area6 tool=rmdangle,rmsa,break,rmdupl,rmbridge thresh=-1,0,0,0,0 --verbose
#v.generalize input=$1_area2 output=$1_area3 method=douglas threshold=50 --overwrite
#v.generalize input=$1_area1 output=$1_area2 method=douglas_reduction threshold=0.002 reduction=30
#v.category input=$1_area3 output=$1_area4 option=del cat=-1
#v.clean input=$1_area3 output=$1_area4 tool=snap,break,rmdupl, thres=0.002
v.out.ogr input=$1_area2 type=area output=$2/$1_area_redux.shp format=ESRI_Shapefile 
  ;;
esac
