#!/bin/bash

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

cd /home/waves/scripts_hindcast

model_lc='bolam'
model_uc='BOLAM'
DATADIR='/OCEANASTORE/progetti/spitbran/ERA5/winds/'$model_uc
OUTDIR='/OCEANASTORE/progetti/spitbran/work/'${model_lc}

#for y in `seq 1979 2019`
for y in `seq 1981 2019`
do
  echo `date`
  echo "---Running $y---"
  for var in u v
  do
# moloch_1993_10v.nc
# moloch_1990-dayavg_10v.nc
    fin=$OUTDIR/${model_lc}_${y}_10${var}.nc
    fou=$OUTDIR/${model_lc}_${y}-dayavg_10${var}.nc
    cdo dayavg $fin $fou
  done
#  # TMAX
#  fin=${DATADIR}/${y}/${model_lc}_${y}_t2m.grib2
#  ftemp=${DATADIR}/${y}/${model_lc}_${y}_daystat_tx.grib2
#  cdo daymax $fin $ftemp
#  fou=$OUTDIR/${model_lc}_${y}_daystat_tx.nc
#  cdo -f nc copy $ftemp $fou
#  rm -f $ftemp
#  # TMIN
#  fin=${DATADIR}/${y}/${model_lc}_${y}_t2m.grib2
#  ftemp=${DATADIR}/${y}/${model_lc}_${y}_daystat_tn.grib2
#  cdo daymin $fin $ftemp
#  fou=$OUTDIR/${model_lc}_${y}_daystat_tn.nc
#  cdo -f nc copy $ftemp $fou
#  rm -f $ftemp
#  # TAVG
#  fin=${DATADIR}/${y}/${model_lc}_${y}_t2m.nc
#  ftemp=${DATADIR}/${y}/${model_lc}_${y}_daystat_tg.grib2
#  cdo dayavg $fin $ftemp
#  fou=$OUTDIR/${model_lc}_${y}_daystat_tg.nc
#  cdo -f nc copy $ftemp $fou
#  rm -f $ftemp
  echo "OK"
done

exit 0;

