#!/bin/bash -l

#-------------------------------
# setting options for SLURM
#-------------------------------
#-------------------------------

#SBATCH --job-name=DAYSTAT
#SBATCH --output=log/DayStat.%N.%j.out
#SBATCH --error=log/DayStat.%N.%j.out
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=capecchi@lamma.toscana.it
#SBATCH --chdir=/home/waves/scripts_hindcast

cd /home/waves/scripts_hindcast/script_sh
DATADIR='/OCEANASTORE/progetti/spitbran/ERA5-Land/t2m'
cd $DATADIR

for y in `seq 1981 2019`
do
  echo running $y
  # TAVG
  cdo dayavg ERA5-Land_${y}-hour_t2m.grib1 ERA5-Land_${y}-daystat_tg.grib1
  cdo -f nc copy ERA5-Land_${y}-daystat_tg.grib1 ERA5-Land_${y}-daystat_tg.nc
  rm -f ERA5-Land_${y}-daystat_tg.grib1
#  # TMAX
#  cdo daymax ERA5-Land_${y}-hour_t2m.grib1 ERA5-Land_${y}-daystat_tx.grib1
#  cdo -f nc copy ERA5-Land_${y}-daystat_tx.grib1 ERA5-Land_${y}-daystat_tx.nc
#  rm -f ERA5-Land_${y}-daystat_tx.grib1
#  # TMIN
#  cdo daymin ERA5-Land_${y}-hour_t2m.grib1 ERA5-Land_${y}-daystat_tn.grib1
#  cdo -f nc copy ERA5-Land_${y}-daystat_tn.grib1 ERA5-Land_${y}-daystat_tn.nc
#  rm -f ERA5-Land_${y}-daystat_tn.grib1
  echo OK $y  
done

exit 0;
