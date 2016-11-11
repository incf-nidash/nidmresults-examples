from subprocess import check_call
import time
import shutil

check_call(['feat ./fsl_default/design.fsf'], shell=True)

# Because feat returns before the analysis is actually finished (and run in the
# background), we check if report.html contains "STILL RUNNING" to
# determine when the analysis is completed.
report_file = './fsl_voxelwise_p0001.feat/report.html'

running = True
while running:
    time.sleep(10)

    with open(report_file, "r") as fp:
        report_head = fp.read()
        if "STILL RUNNING" not in report_head:
            running = False
        else:
            print("STILL RUNNING")

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
