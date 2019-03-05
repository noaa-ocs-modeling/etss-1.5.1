#!/bin/bash

## Load Python 2.7.13
#module use /usrx/local/dev/modulefiles
#module load python/2.7.13

#export pyPath="/usrx/local/dev/python/2.7.13/bin"
export pyPath="/Users/svinogra/anaconda/bin"
export platform="/Users/svinogra/mirrors/wcoss/surge"

export myModules=${platform}"/gpfs/hps3/nos/noscrub/nwprod/csdlpy-1.5.1"
export pythonCode=${platform}"/gpfs/hps3/nos/noscrub/nwprod/etss-1.5.1/etss/post.py"
export logFile=${platform}"/gpfs/hps3/nos/noscrub/polar/estofs_atl/etss_post.log"

export ofsDir=${platform}"/gpfs/hps/nco/ops/com/etss/prod/"
export basin="atl"
export stormCycle="latest"   #"2018030218"
#export stormCycle="2018081200"

export outputDir=${platform}"/gpfs/hps3/nos/noscrub/polar/etss/"
export tmpDir=${platform}"/gpfs/hps3/nos/noscrub/tmp/etss/"
export pltCfgFile=${platform}"/gpfs/hps3/nos/noscrub/nwprod/etss-1.5.1/scripts/config.plot.etss.atl.ini"

export ftpLogin="svinogradov@emcrzdm"
export ftpPath="/home/www/polar/estofs/atl_etss/"
#export ftpPath="/home/www/polar/estofs/atl_"${stormCycle}

cd ${tmpDir}
PYTHONPATH=${myModules} ${pyPath}/python -W ignore ${pythonCode} -i ${ofsDir} -s ${basin} -z ${stormCycle} -o ${outputDir} -t ${tmpDir} -p ${pltCfgFile} -u ${ftpLogin} -f ${ftpPath} # > ${logFile}
