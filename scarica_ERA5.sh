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

cd /home/waves/scripts_hindcast

wget -O /OCEANASTORE/progetti/spitbran/ERA5-Land/winds/WIND10v_1981-1983.grib1 https://download-0011.copernicus-climate.eu/cache-compute-0011/cache/data9/adaptor.mars.internal-1614951381.3842952-7376-30-0daaf39e-c6e0-472e-8377-9bc56ce7390c.grib 

exit 0;

