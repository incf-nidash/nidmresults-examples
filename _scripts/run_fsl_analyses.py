from subprocess import check_call
import time
import shutil
import os


def wait_for_feat(report_file):
    running = True
    while running:
        time.sleep(10)

        with open(report_file, "r") as fp:
            report_head = fp.read()
            if "STILL RUNNING" not in report_head:
                running = False
            else:
                print("STILL RUNNING")


def run_feat(dataset_name, out_featdir):
    check_call(['feat ./' + dataset_name + '/design.fsf'], shell=True)

    # Because feat returns before the analysis is actually finished (and run in
    # the background), we check if report.html contains "STILL RUNNING" to
    # determine when the analysis is completed.
    report_file = './' + out_featdir + '/report.html'
    wait_for_feat(report_file)

    # Keep a copy of README.md and config.json files
    readme = os.path.join('.', dataset_name, 'README.md')
    tmp_readme = os.path.join('.', 'tmp_README.md')
    shutil.copyfile(readme, tmp_readme)
    cfg = os.path.join('.', dataset_name, 'config.json')
    tmp_cfg = os.path.join('.', 'tmp_config.json')
    shutil.copyfile(cfg, tmp_cfg)

    shutil.rmtree(dataset_name)
    shutil.move(out_featdir, dataset_name)

    # Move back README.md and config.json files
    shutil.move(tmp_readme, readme)
    shutil.move(tmp_cfg, cfg)


if __name__ == "__main__":
    run_feat('fsl_default', 'fsl_voxelwise_p0001.feat')


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
