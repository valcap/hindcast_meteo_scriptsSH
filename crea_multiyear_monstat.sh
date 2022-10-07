#!/bin/bash

# GRIPHO 10 km
cd $HOME/art_hindcast_meteo/DATA/GRIPHO/tp
cdo -O mergetime gripho-v2-10km_mon_tp_{2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016}.nc gripho-v2-10km_mon_tp_2001-2016.nc
cdo ymonmean gripho-v2-10km_mon_tp_2001-2016.nc gripho-v2-10km_mon_tp_AVG2001-2016.nc

# ARCIS
cd $HOME/art_hindcast_meteo/DATA/ARCIS/tp
cdo -O mergetime ARCIS_mon_tp_{1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015}.nc ARCIS_mon_tp_1981-2015.nc
cdo ymonmean ARCIS_mon_tp_1981-2015.nc ARCIS_mon_tp_AVG1981-2015.nc

# E-OBS
cd $HOME/art_hindcast_meteo/DATA/E-OBS/tp
cdo -O mergetime E-OBS_mon_tp_{1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019}.nc E-OBS_mon_tp_1981-2019.nc
cdo ymonmean E-OBS_mon_tp_1981-2019.nc E-OBS_mon_tp_AVG1981-2019.nc
#
cdo -O mergetime E-OBS_mon_tp_{1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015}.nc E-OBS_mon_tp_1981-2015.nc
cdo ymonmean E-OBS_mon_tp_1981-2015.nc E-OBS_mon_tp_AVG1981-2015.nc

# moloch
cd $HOME/art_hindcast_meteo/DATA/MOLOCH/tp
for y in `seq 1981 2019`
do
  cdo -select,year=$y moloch_mon_tp_${y}.nc pippo_${y}.nc
done
cdo -O mergetime pippo_{1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019}.nc moloch_mon_tp_1981-2019.nc
rm -f pippo_*.nc
cdo ymonmean moloch_mon_tp_1981-2019.nc moloch_mon_tp_AVG1981-2019.nc
#
for y in `seq 1981 2015`
do
  cdo -select,year=$y moloch_mon_tp_${y}.nc pippo_${y}.nc
done
cdo -O mergetime pippo_{1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015}.nc moloch_mon_tp_1981-2015.nc
rm -f pippo_*.nc
cdo ymonmean moloch_mon_tp_1981-2015.nc moloch_mon_tp_AVG1981-2015.nc
#
for y in `seq 2001 2016`
do
  cdo -select,year=$y moloch_mon_tp_${y}.nc pippo_${y}.nc
done
cdo -O mergetime pippo_{2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015}.nc moloch_mon_tp_2001-2016.nc
rm -f pippo_*.nc
cdo ymonmean moloch_mon_tp_2001-2016.nc moloch_mon_tp_AVG2001-2016.nc

# BOLAM
cd $HOME/art_hindcast_meteo/DATA/BOLAM/tp
for y in `seq 1981 2019`
do
  cdo -select,year=$y bolam_mon_tp_${y}.nc pippo_${y}.nc
done
cdo -O mergetime pippo_{1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019}.nc bolam_mon_tp_1981-2019.nc
rm -f pippo_*.nc
cdo ymonmean bolam_mon_tp_1981-2019.nc bolam_mon_tp_AVG1981-2019.nc
#
for y in `seq 1981 2015`
do
  cdo -select,year=$y bolam_mon_tp_${y}.nc pippo_${y}.nc
done
cdo -O mergetime pippo_{1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015}.nc bolam_mon_tp_1981-2015.nc
rm -f pippo_*.nc
cdo ymonmean bolam_mon_tp_1981-2015.nc bolam_mon_tp_AVG1981-2015.nc
#
for y in `seq 2001 2016`
do
  cdo -select,year=$y bolam_mon_tp_${y}.nc pippo_${y}.nc
done
cdo -O mergetime pippo_{2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015}.nc bolam_mon_tp_2001-2016.nc
rm -f pippo_*.nc
cdo ymonmean bolam_mon_tp_2001-2016.nc bolam_mon_tp_AVG2001-2016.nc

# ERA5-Land
cd $HOME/art_hindcast_meteo/DATA/ERA5-Land/tp
for y in `seq 1981 2019`
do
  cdo -select,year=$y ERA5-Land_mon_tp_${y}.nc pippo_${y}.nc
done
cdo -O mergetime pippo_{1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019}.nc ERA5-Land_mon_tp_1981-2019.nc
rm -f pippo_*.nc
cdo ymonmean ERA5-Land_mon_tp_1981-2019.nc ERA5-Land_mon_tp_AVG1981-2019.nc
#
for y in `seq 1981 2015`
do
  cdo -select,year=$y ERA5-Land_mon_tp_${y}.nc pippo_${y}.nc
done
cdo -O mergetime pippo_{1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015}.nc ERA5-Land_mon_tp_1981-2015.nc
rm -f pippo_*.nc
cdo ymonmean ERA5-Land_mon_tp_1981-2015.nc ERA5-Land_mon_tp_AVG1981-2015.nc
#
for y in `seq 2001 2016`
do
  cdo -select,year=$y ERA5-Land_mon_tp_${y}.nc pippo_${y}.nc
done
cdo -O mergetime pippo_{2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015}.nc ERA5-Land_mon_tp_2001-2016.nc
rm -f pippo_*.nc
cdo ymonmean ERA5-Land_mon_tp_2001-2016.nc ERA5-Land_mon_tp_AVG2001-2016.nc

exit 0;

