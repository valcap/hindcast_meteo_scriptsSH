#!/bin/bash

cd $HOME/art_hindcast_meteo/DATA/ARCIS/tp

for y in `seq 1981 2015`
do
 echo running $y
# cdo yearsum ARCIS_GG_${y}.nc ARCIS_year_tp_${y}.nc
 cdo monsum ARCIS_GG_${y}.nc ARCIS_mon_tp_${y}.nc
done

exit 0;
