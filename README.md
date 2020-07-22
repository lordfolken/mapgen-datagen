# Generate OSM data for Mapgen [WIP]

Prototype for building more detailed maps for xcsoar.
Takes osm files and currently genereates:

* water_line/water_area
* railway
* roads

## Usage
 * install docker and pull the dockercontainer: 
 * ./doit.sh do it all
 * zz_packup generates a xcm file
 * zz_test copies the map into xcsoar data and starts xcsoar

## issues:
 * city boundaries are not yet consistent 
 
## Goals
 * To create the osm data needed for xcsoar, worldwide. 
 * Deprecate Vmap0 dataset
 * automatic process where the data is updated periodically
 * create maps / dataset when the source is updated

## ideas
 * lots, but its 2am. 
