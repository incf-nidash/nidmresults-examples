import os
from subprocess import check_call
import time
import stat
import shutil

# os.path.getmtime(path)

#! /bin/bash

check_call(['feat ./fsl_default/design.fsf'], shell=True)

# Because feat returns before the analysis is actually finished (and run in the
# background), we check how long ago the report_log.html file was modified to
# determine when the analysis is completed.
x_sec_ago = 0
# If the report was modified more than 3 minutes ago then we consider the
# analysis to be completed
while x_sec_ago/60 < 3:
    time.sleep(10)
    log_file = './fsl_voxelwise_p0001.feat/report_log.html'
    # Check how long ago the log file was modified
    x_sec_ago = (time.time() - os.stat(log_file)[stat.ST_MTIME])
    print(x_sec_ago)

shutil.rmtree('fsl_default')
shutil.move('fsl_voxelwise_p0001.feat', 'fsl_default')



# rm -r `pwd`/fsl_default
# mv `pwd`/fsl_voxelwise_p0001.feat `pwd`/fsl_default
# git checkout fsl_default/README.md
# git checkout fsl_default/config.json
# feat `pwd`/fsl_con_f/design.fsf
# feat `pwd`/fsl_contrast_mask/design.fsf
# feat `pwd`/fsl_default/design.fsf
# feat `pwd`/fsl_full_examples001/design.fsf
# feat `pwd`/fsl_gamma_basis/design.fsf
# feat `pwd`/fsl_gaussian/design.fsf
# feat `pwd`/fsl_group_btw/design.fsf
# feat `pwd`/fsl_group_ols/design.fsf
# feat `pwd`/fsl_group_wls/design.fsf
# feat `pwd`/fsl_hrf_fir/design.fsf
# feat `pwd`/fsl_hrf_gammadiff/design.fsf
# feat `pwd`/fsl_thr_clustfwep05/design.fsf
# feat `pwd`/fsl_thr_voxelfwep05/design.fsf
