#!/bin/bash

# Global variables
exfile='valoristazionivvh4707q7dqcs359mvl5onkg41.csv'
skiplines='9'

for y in `seq 2020 -1 1979`
do
  echo Working on year $y
# general settings on file naming conventions
  zipfile='SCIA_PREC'${y}'.zip'
  csvfile='SCIA_PREC'${y}'.csv'
  new_csvfile='SCIA_TotAnnPre_'${y}'.csv'; rm -f $new_csvfile
  anag_csvfile='SCIA_Anag_'${y}'.csv'; rm -f $anag_csvfile
# copy zip file from repository to working directory
  cp ORIG/$zipfile .
  if [ ! -e $zipfile ]; then
    echo "ops cannot find $zipfile in `pwd`"; exit 1
  fi  
  unzip -qq -o $zipfile
  if [ $? -ne 0 ]; then
    echo "ops cannot unzip $zipfile"; exit 1
  else
    rm -f ./$zipfile
  fi

# move the extracted csv file to a new filename  
  if [ ! -e $exfile ]; then
    echo "ops cannot find $exfile"; exit 1
  else
    mv $exfile $csvfile
  fi

# extract relevant information  from new extracted file
  res=`grep "Anno: $y" $csvfile`
  if [ ! $? -eq 0 ]; then
    echo "ops we are not working on the correct file"; exit
  else
    echo "OK confirming $res"
    echo "cod,lon,lat,val" > $new_csvfile
    cat $csvfile | sed 1,${skiplines}d | cut -d ',' -f2,4,5,6 | sed -e "s/\ /_/g" | grep -v "_ANDREA_BONAGIA" >> $new_csvfile
    if [ ! $? -eq 0 ]; then
      echo "ops problems in extracting relevant information"; exit
    fi
    cat $csvfile | sed 1,${skiplines}d | cut -d ',' -f2,4,5 | sed -e "s/\ /_/g" > $anag_csvfile
    if [ ! $? -eq 0 ]; then
      echo "ops problems in extracting relevant information"; exit
    fi
    rm -f $csvfile
  fi
done

exit 0

