#!/bin/bash

#!/bin/bash -l

#-------------------------------
# setting options for SLURM
#-------------------------------
#-------------------------------

#SBATCH --job-name=DWNLD
#SBATCH --output=log/Downl.%N.%j.out
#SBATCH --error=log/Downl.%N.%j.out
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=capecchi@lamma.toscana.it
#SBATCH --chdir=/home/waves/scripts_hindcast

ANAG_FILE='/OCEANASTORE/progetti/spitbran/NOAA/stations_synop_BIGGER-DOMAIN.csv'

cd /OCEANASTORE/progetti/spitbran/NOAA/gsod

#for cod in `cat $ANAG_FILE | cut -d ',' -f1`
for cod in `sed 1,1d $ANAG_FILE | cut -d ',' -f1`
do
  echo "+working on $cod"
#  for y in `seq 1981 2019`
  for y in 2018
  do
    echo "+++working on $y"
    fou='NOAA-GSOD_'${cod}'_'${y}'.csv'
    wget -q -O ${fou} https://www.ncei.noaa.gov/data/global-summary-of-the-day/access/${y}/${cod}.csv
    if [ $? -eq 0 ]; then
      echo "+++++Checking $cod $y"
      nl=`cat $fou | wc -l`
      echo "nl is $nl"
      # 364 for 1999, which has one missing day (1999-01-10)
      if [ $nl -le 364 ]; then
        echo "+++++++$cod $y has missing daily data"
        rm -f $fou
        continue
      fi
      if [ $nl -ge 368 ]; then
        echo "+++++++$cod $y has a generic error"
        rm -f $fou
        continue
      fi
      res=`/home/waves/scripts_hindcast/script_sh/is_leap $y`
      if [ $res -eq 0 ]; then
        if [ $nl -ne 367 ]; then
          echo "+++++++$a is a leap year and"
          echo "+++++++$cod $y has missing daily data"
          rm -f $fou
        fi
      fi
      echo "+++++OK $cod $y"
    else
      echo "+++++cannot download $cod $y"
      rm -f $fou
    fi
  done
done

exit 0;

