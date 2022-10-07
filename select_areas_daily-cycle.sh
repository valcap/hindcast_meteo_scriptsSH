#!/bin/bash

# ALPS-OVEST (NW in Brunetti et al 2001)
lon1ALPO=8.00
lon2ALPO=11.0
lat1ALPO=45.7
lat2ALPO=46.5
# ALPS-EST (NEN in Brunetti et al 2001)
lon1ALPE=12.5
lon2ALPE=13.5
lat1ALPE=46.0
lat2ALPE=46.7
# PIANURA PADANA (NES in Brunetti et al 2001)
lon1PAD=8.00
lon1PAD=10.00
lon2PAD=12.5
lat1PAD=44.7
lat2PAD=45.5
# TIRRENO (CE in Brunetti et al 2001)
lon1TIR=10.5
lon2TIR=11.8
lat1TIR=42.5
lat2TIR=43.8
# SARDEGNA (IS in Brunetti et al 2001)
lon1SAR=8.5
lon2SAR=9.5
lat1SAR=39.0
lat2SAR=41.0
# SUD (SO in Brunetti et al 2001)
lon1SUD=14.0
lon2SUD=16.0
lat1SUD=40.8
lat2SUD=41.8
# MIL (as in Reder et al 2022)
lon1MIL=8.75
lon2MIL=9.75
lat1MIL=45.0
lat2MIL=45.75
# SAR (as in Brunetti et al 2001)
lon1SAR=8.5
lon2SAR=9.5
lat1SAR=39.0
lat2SAR=41.0
# Season
my_season='MAM'

#
#############
# GRIPHO
#############
cd $HOME/art_hindcast_meteo/DATA/GRIPHO/tp 
fin='gripho-v2-3km_daily-cycle_'$my_season'.nc'
for suf in ALPO ALPE PAD TIR MIL SUD SAR
do
  fou=$HOME/art_hindcast_meteo/res/'gripho-v2-3km_'$suf'_'$my_season'.csv'
  case $suf in
  ALPO)
    lon1=$lon1ALPO
    lon2=$lon2ALPO
    lat1=$lat1ALPO
    lat2=$lat2ALPO
    ;;
  ALPE)
    lon1=$lon1ALPE
    lon2=$lon2ALPE
    lat1=$lat1ALPE
    lat2=$lat2ALPE
    ;;
  PAD)
    lon1=$lon1PAD
    lon2=$lon2PAD
    lat1=$lat1PAD
    lat2=$lat2PAD
    ;;
  TIR)
    lon1=$lon1TIR
    lon2=$lon2TIR
    lat1=$lat1TIR
    lat2=$lat2TIR
    ;;
  MIL)
    lon1=$lon1MIL
    lon2=$lon2MIL
    lat1=$lat1MIL
    lat2=$lat2MIL
    ;;
  SUD)
    lon1=$lon1SUD
    lon2=$lon2SUD
    lat1=$lat1SUD
    lat2=$lat2SUD
    ;;
  SAR)
    lon1=$lon1SAR
    lon2=$lon2SAR
    lat1=$lat1SAR
    lat2=$lat2SAR
    ;;    
  *)
    echo -n "unknown"
    exit 1
    ;;
  esac
  cdo sellonlatbox,$lon1,$lon2,$lat1,$lat2 $fin pippo.nc
  cdo -fldmean pippo.nc pluto.nc
  cdo -outputtab,value pluto.nc > $fou
  rm -f pluto.nc pippo.nc
done

#############
# MOLOCH
#############
cd $HOME/art_hindcast_meteo/DATA/MOLOCH/tp
fin='moloch_daily-cycle_'$my_season'.nc'
for suf in ALPO ALPE PAD TIR MIL SUD SAR
do
  fou=$HOME/art_hindcast_meteo/res/'moloch_'$suf'_'$my_season'.csv'
  case $suf in
  ALPO)
    lon1=$lon1ALPO
    lon2=$lon2ALPO
    lat1=$lat1ALPO
    lat2=$lat2ALPO
    ;;
  ALPE)
    lon1=$lon1ALPE
    lon2=$lon2ALPE
    lat1=$lat1ALPE
    lat2=$lat2ALPE
    ;;
  PAD)
    lon1=$lon1PAD
    lon2=$lon2PAD
    lat1=$lat1PAD
    lat2=$lat2PAD
    ;;
  TIR)
    lon1=$lon1TIR
    lon2=$lon2TIR
    lat1=$lat1TIR
    lat2=$lat2TIR
    ;;
  MIL)
    lon1=$lon1MIL
    lon2=$lon2MIL
    lat1=$lat1MIL
    lat2=$lat2MIL
    ;;
  SUD)
    lon1=$lon1SUD
    lon2=$lon2SUD
    lat1=$lat1SUD
    lat2=$lat2SUD
    ;;
  SAR)
    lon1=$lon1SAR
    lon2=$lon2SAR
    lat1=$lat1SAR
    lat2=$lat2SAR
    ;;
  *)
    echo -n "unknown"
    exit 1
    ;;
  esac
  cdo sellonlatbox,$lon1,$lon2,$lat1,$lat2 $fin pippo.nc
  cdo -fldmean pippo.nc pluto.nc
  cdo -outputtab,value pluto.nc > $fou
  rm -f pluto.nc pippo.nc
done

#############
# BOLAM
#############
cd $HOME/art_hindcast_meteo/DATA/BOLAM/tp
fin='bolam_daily-cycle_'$my_season'.nc'
for suf in ALPO ALPE PAD TIR MIL SUD SAR
do
  fou=$HOME/art_hindcast_meteo/res/'bolam_'$suf'_'$my_season'.csv'
  case $suf in
  ALPO)
    lon1=$lon1ALPO
    lon2=$lon2ALPO
    lat1=$lat1ALPO
    lat2=$lat2ALPO
    ;;
  ALPE)
    lon1=$lon1ALPE
    lon2=$lon2ALPE
    lat1=$lat1ALPE
    lat2=$lat2ALPE
    ;;
  PAD)
    lon1=$lon1PAD
    lon2=$lon2PAD
    lat1=$lat1PAD
    lat2=$lat2PAD
    ;;
  TIR)
    lon1=$lon1TIR
    lon2=$lon2TIR
    lat1=$lat1TIR
    lat2=$lat2TIR
    ;;
  MIL)
    lon1=$lon1MIL
    lon2=$lon2MIL
    lat1=$lat1MIL
    lat2=$lat2MIL
    ;;
  SUD)
    lon1=$lon1SUD
    lon2=$lon2SUD
    lat1=$lat1SUD
    lat2=$lat2SUD
    ;;
  SAR)
    lon1=$lon1SAR
    lon2=$lon2SAR
    lat1=$lat1SAR
    lat2=$lat2SAR
    ;;
  *)
    echo -n "unknown"
    exit 1
    ;;
  esac
  cdo sellonlatbox,$lon1,$lon2,$lat1,$lat2 $fin pippo.nc
  cdo -fldmean pippo.nc pluto.nc
  cdo -outputtab,value pluto.nc > $fou
  rm -f pluto.nc pippo.nc
done

#############
# ERA5-Land
#############
cd $HOME/art_hindcast_meteo/DATA/ERA5-Land/tp
fin='ERA5-Land_daily-cycle_'$my_season'.nc'
for suf in ALPO ALPE PAD TIR MIL SUD SAR
do
  fou=$HOME/art_hindcast_meteo/res/'ERA5-Land_'$suf'_'$my_season'.csv'
  case $suf in
  ALPO)
    lon1=$lon1ALPO
    lon2=$lon2ALPO
    lat1=$lat1ALPO
    lat2=$lat2ALPO
    ;;
  ALPE)
    lon1=$lon1ALPE
    lon2=$lon2ALPE
    lat1=$lat1ALPE
    lat2=$lat2ALPE
    ;;
  PAD)
    lon1=$lon1PAD
    lon2=$lon2PAD
    lat1=$lat1PAD
    lat2=$lat2PAD
    ;;
  TIR)
    lon1=$lon1TIR
    lon2=$lon2TIR
    lat1=$lat1TIR
    lat2=$lat2TIR
    ;;
  MIL)
    lon1=$lon1MIL
    lon2=$lon2MIL
    lat1=$lat1MIL
    lat2=$lat2MIL
    ;;
  SUD)
    lon1=$lon1SUD
    lon2=$lon2SUD
    lat1=$lat1SUD
    lat2=$lat2SUD
    ;;
  SAR)
    lon1=$lon1SAR
    lon2=$lon2SAR
    lat1=$lat1SAR
    lat2=$lat2SAR
    ;;
  *)
    echo -n "unknown"
    exit 1
    ;;
  esac
  cdo sellonlatbox,$lon1,$lon2,$lat1,$lat2 $fin pippo.nc
  cdo -fldmean pippo.nc pluto.nc
  cdo -outputtab,value pluto.nc > $fou
  rm -f pluto.nc pippo.nc
done

exit 0;

