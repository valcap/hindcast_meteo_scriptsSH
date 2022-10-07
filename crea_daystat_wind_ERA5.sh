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
DATADIR='/OCEANASTORE/progetti/spitbran/ERA5-Land/winds'
cd $DATADIR

for y in `seq 1992 1992`
do
  echo running $y
  # AVG
  for var in u v
  do
    cdo dayavg     ERA5-Land_${y}-hour_10${var}.grib1   ERA5-Land_${y}-dayavg_10${var}.grib1
    cdo -f nc copy ERA5-Land_${y}-dayavg_10${var}.grib1 ERA5-Land_${y}-dayavg_10${var}.nc
    rm  -f         ERA5-Land_${y}-dayavg_10${var}.grib1
  done
  echo OK $y  
done

exit 0;
