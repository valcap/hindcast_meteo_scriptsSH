#!/bin/bash -l

#-------------------------------
# setting options for SLURM
#-------------------------------
#-------------------------------

#SBATCH --job-name=PREPNOAA
#SBATCH --output=log/PrepNOAA.%N.%j.out
#SBATCH --error=log/PrepNOAA.%N.%j.out
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=capecchi@lamma.toscana.it
#SBATCH --chdir=/home/waves/scripts_hindcast

ANAG_FILE='/OCEANASTORE/progetti/spitbran/NOAA/stations_synop_BIGGER-DOMAIN.csv'

my_header_data='"STATION","DATE","LATITUDE","LONGITUDE","ELEVATION","NAME","TEMP","TEMP_ATTRIBUTES","DEWP","DEWP_ATTRIBUTES","SLP","SLP_ATTRIBUTES","STP","STP_ATTRIBUTES","VISIB","VISIB_ATTRIBUTES","WDSP","WDSP_ATTRIBUTES","MXSPD","GUST","MAX","MAX_ATTRIBUTES","MIN","MIN_ATTRIBUTES","PRCP","PRCP_ATTRIBUTES","SNDP","FRSHTT"'
my_header_anag='STATION_ID,STATION,BEGIN_DATE,END_DATE,STATE,COUNTRY,LATITUDE,LONGITUDE,ELEVATION'

cd /OCEANASTORE/progetti/spitbran/NOAA/gsod

for y in `seq 1981 2019`
do
  cd $y
  ####
  echo Creating data for $y
  fdata='NOAA-GSOD_DATA_'${y}'.csv'
  rm -fv $fdata
  echo $my_header_data > $fdata
  for f in `ls NOAA-GSOD_[0-9]*_${y}.csv`
  do
    cat $f | grep -v "SLP_ATTRIBUTES" >> $fdata
  done
  ####
  echo Creating anag for $y
  fanag='NOAA-GSOD_ANAG_'${y}'.csv'
  rm -fv $fanag
  echo $my_header_anag > $fanag
  for cod in `cat $fdata | cut -d',' -f 1 | grep -v "\.9" | grep -v STATIO | uniq`
  do
    newcod=`echo $cod | sed -e "s/\"//g"`
    cat $ANAG_FILE | grep $newcod >> $fanag
  done
  ####
  cd -
done

exit 0

