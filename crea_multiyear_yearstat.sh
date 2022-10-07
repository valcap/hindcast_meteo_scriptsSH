#!/bin/bash

# GRIPHO 10 km (ATT QUI SI "BARA" SUL 2001)
cd $HOME/art_hindcast_meteo/DATA/GRIPHO/tp
cdo -O mergetime gripho-v2-10km_year_tp_{2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016}.nc gripho-v2-10km_year_tp_2001-2016.nc
cdo timmean gripho-v2-10km_year_tp_2001-2016.nc gripho-v2-10km_year_tp_AVG2001-2016.nc
# GRIPHO 3 km (ATT QUI SI "BARA" SUL 2001)
cdo -O mergetime gripho-v2-3km_year_tp_{2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016}.nc gripho-v2-3km_year_tp_2001-2016.nc
cdo timmean gripho-v2-3km_year_tp_2001-2016.nc gripho-v2-3km_year_tp_AVG2001-2016.nc

# ARCIS
cd $HOME/art_hindcast_meteo/DATA/ARCIS/tp
cdo -O mergetime ARCIS_year_tp_{1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015}.nc ARCIS_year_tp_1981-2015.nc
cdo timavg ARCIS_year_tp_1981-2015.nc ARCIS_year_tp_AVG1981-2015.nc

# E-OBS
cd $HOME/art_hindcast_meteo/DATA/E-OBS/tp
cdo -O mergetime E-OBS_year_tp_{1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019}.nc E-OBS_year_tp_1981-2019.nc
cdo timavg E-OBS_year_tp_1981-2019.nc E-OBS_year_tp_AVG1981-2019.nc

##########################################
# moloch
##########################################
cd $HOME/art_hindcast_meteo/DATA/MOLOCH/tp
cdo -O mergetime moloch_year_tp_{1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019}.nc moloch_year_tp_1981-2019.nc
cdo timavg moloch_year_tp_1981-2019.nc moloch_year_tp_AVG1981-2019.nc
#
cdo -O mergetime moloch_year_tp_{1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015}.nc moloch_year_tp_1981-2015.nc
cdo timavg moloch_year_tp_1981-2015.nc moloch_year_tp_AVG1981-2015.nc
#
cdo -O mergetime moloch_year_tp_{2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016}.nc moloch_year_tp_2001-2016.nc
cdo timavg moloch_year_tp_2001-2016.nc moloch_year_tp_AVG2001-2016.nc

##########################################
# BOLAM
##########################################
cd $HOME/art_hindcast_meteo/DATA/BOLAM/tp
cdo -O mergetime bolam_year_tp_{1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019}.nc bolam_year_tp_1981-2019.nc
cdo timavg bolam_year_tp_1981-2019.nc bolam_year_tp_AVG1981-2019.nc
#
cdo -O mergetime bolam_year_tp_{1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015}.nc bolam_year_tp_1981-2015.nc
cdo timavg bolam_year_tp_1981-2015.nc bolam_year_tp_AVG1981-2015.nc
#
cdo -O mergetime bolam_year_tp_{2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016}.nc bolam_year_tp_2001-2016.nc
cdo timavg bolam_year_tp_2001-2016.nc bolam_year_tp_AVG2001-2016.nc

##########################################
# ERA5-Land
##########################################
cd $HOME/art_hindcast_meteo/DATA/ERA5-Land/tp
cdo -O mergetime ERA5-Land_year_tp_{1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019}.nc ERA5-Land_year_tp_1981-2019.nc
cdo timavg ERA5-Land_year_tp_1981-2019.nc ERA5-Land_year_tp_AVG1981-2019.nc
#
cdo -O mergetime ERA5-Land_year_tp_{1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015}.nc ERA5-Land_year_tp_1981-2015.nc
cdo timavg ERA5-Land_year_tp_1981-2015.nc ERA5-Land_year_tp_AVG1981-2015.nc
#
cdo -O mergetime ERA5-Land_year_tp_{2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016}.nc ERA5-Land_year_tp_2001-2016.nc
cdo timavg ERA5-Land_year_tp_2001-2016.nc ERA5-Land_year_tp_AVG2001-2016.nc

exit 0;

