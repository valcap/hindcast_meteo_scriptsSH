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

for y in `seq 1981 2019`
do
  echo `date`
  echo "---Running $y---"
  grib_copy -w shortName=10u $DATADIR/${y}/${model_lc}_${y}_wind10m.grib2 $OUTDIR/${model_lc}_${y}_10u.grib2
  grib_copy -w shortName=10v $DATADIR/${y}/${model_lc}_${y}_wind10m.grib2 $OUTDIR/${model_lc}_${y}_10v.grib2
  cdo -f nc copy $OUTDIR/${model_lc}_${y}_10u.grib2 $OUTDIR/${model_lc}_${y}_10u.nc
  cdo -f nc copy $OUTDIR/${model_lc}_${y}_10v.grib2 $OUTDIR/${model_lc}_${y}_10v.nc
  rm -f $OUTDIR/${model_lc}_${y}_10u.grib2 $OUTDIR/${model_lc}_${y}_10v.grib2
  echo "OK"
done

exit 0;

