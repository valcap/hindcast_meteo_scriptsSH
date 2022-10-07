#!/bin/bash

cd $HOME/art_hindcast_meteo/res
for seas in MAM 
do
  for suf in ALPO ALPE PAD TIR SUD SAR
  do
    paste gripho-v2-3km_${suf}_${seas}.csv ERA5-Land_${suf}_${seas}.csv moloch_${suf}_${seas}.csv bolam_${suf}_${seas}.csv > ALL_${suf}_${seas}.csv
  done
done

exit 0
