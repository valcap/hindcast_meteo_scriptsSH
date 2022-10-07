#!/bin/bash

cd /home/capecchi/art_hindcast_meteo/DATA/GRIPHO/tp

fin='gripho-v1-3km_year_tp_2016.nc'
if [ ! -e $fin ]; then
	echo "ops $fin"; exit 1
fi
fou='test_grid3km.nc'
if [ -e $fou ]; then
	rm -f $fou
fi

my_s_srs='+proj=laea +lat_0=52 +lon_0=10 +x_0=4321000 +y_0=3210000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs'
my_t_srs='EPSG:4326'

gdalwarp $fin $fou -s_srs "$my_s_srs" -t_srs $my_t_srs

exit 0;

