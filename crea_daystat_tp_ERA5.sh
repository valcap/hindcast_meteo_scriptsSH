#!/bin/bash

for y in `seq 1981 2019`
do
 echo running $y
 cdo daysum ERA5-Land_${y}-hour_tp.grib1 ERA5-Land_${y}-daysum_tp.grib1
 cdo -f nc copy ERA5-Land_${y}-daysum_tp.grib1 ERA5-Land_${y}-daysum_tp.nc
done

exit 0;
