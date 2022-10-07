#!/bin/bash

#-------------------------------
# setting options for SLURM
#-------------------------------
#-------------------------------

#################SBATCH --job-name=DAYSTAT
#################SBATCH --output=log/DayStat.%N.%j.out
#################SBATCH --error=log/DayStat.%N.%j.out
#################SBATCH --mail-type=FAIL
#################SBATCH --mail-user=capecchi@lamma.toscana.it
#################SBATCH --chdir=/home/waves/scripts_hindcast

DATADIR='/OCEANASTORE/progetti/spitbran/GRIPHO/tp'
OUTDIR='/OCEANASTORE/progetti/spitbran/GRIPHO/tp'
iniy=2001
endy=2016

cd $DATADIR

###########################
# 10km Grid
###########################
grid_def_file='grid10km.latlon'
cat > $grid_def_file <<EOF
#
# gridID 1
#
gridtype  = lonlat
gridsize  = 14170
xsize     = 130
ysize     = 109
xname     = lon
xlongname = "longitude"
xunits    = "degrees_east"
yname     = lat
ylongname = "latitude"
yunits    = "degrees_north"
xfirst    = 6.39331393519741
xinc      = 0.103295684345258
yfirst    = 36.2956758760307
yinc      = 0.103295684345258
EOF

for y in `seq $iniy $endy`
do
  echo `date`
  echo "---Running $y---"
  # tp
  fin=gripho-v1_1h_10km_${y}.nc
  fou=gripho-v2-10km_hour_tp_${y}.nc
  cdo remapnn,$grid_def_file $fin $fou
  fouy=gripho-v2-10km_year_tp_${y}.nc
  foum=gripho-v2-10km_mon_tp_${y}.nc
  foud=gripho-v2-10km_day_tp_${y}.nc
  cdo yearsum $fou $fouy
  cdo monsum $fou $foum
  cdo daysum $fou $foud
  echo "OK $y"
done
rm -f $grid_def_file

###########################
# 3km Grid
###########################
grid_def_file='grid3km.latlon'
cat > $grid_def_file <<EOF
#
# gridID 1
#
gridtype  = lonlat
gridsize  = 162987
xsize     = 449
ysize     = 363
xname     = lon
xlongname = "longitude"
xunits    = "degrees_east"
yname     = lat
ylongname = "latitude"
yunits    = "degrees_north"
xfirst    = 6.3883059731127281 
xinc      = 0.031145579
yfirst    = 36.1932194385164152
yinc      = 0.031145579
EOF

for y in `seq $iniy $endy`
do
  echo `date`
  echo "---Running $y---"
  # tp
  fin=gripho-v1_1h_3km_${y}.nc
  fou=gripho-v2-3km_hour_tp_${y}.nc
  cdo remapnn,$grid_def_file $fin $fou
  fouy=gripho-v2-3km_year_tp_${y}.nc
  foum=gripho-v2-3km_mon_tp_${y}.nc
  foud=gripho-v2-3km_day_tp_${y}.nc
  cdo yearsum $fou $fouy
  cdo monsum $fou $foum
  cdo daysum $fou $foud
  echo "OK $y"
done
rm -f $grid_def_file

exit 0;

