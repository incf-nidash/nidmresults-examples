from subprocess import check_call
import time
import shutil
import os
import sys


def wait_for_feat(report_file):
    running = True
    while running:
        time.sleep(10)

        with open(report_file, "r") as fp:
            report_head = fp.read()
            if "STILL RUNNING" not in report_head:
                running = False
            else:
                print("."),
                sys.stdout.flush()


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

    # Move the feat directory to a folder named after the dataset under study
    shutil.rmtree(dataset_name)
    shutil.move(out_featdir, dataset_name)

    # Move back README.md and config.json files
    shutil.move(tmp_readme, readme)
    shutil.move(tmp_cfg, cfg)


if __name__ == "__main__":

    studies = (
        ('fsl_con_f', 'fsl_f_test.feat'),
        ('fsl_contrast_mask', 'fsl_contrast_mask.feat'),
        ('fsl_default', 'fsl_voxelwise_p0001.feat'),
        # Do not recompute fsl_full_examples001 as we want to keep 
        # peaks and clusters as defined manually 
        # ('fsl_full_examples001', 'fsl_full_examples001.feat'),
        ('fsl_gamma_basis', 'fsl_gamma_basis.feat'),
        ('fsl_gaussian', 'fsl_gaussian.feat'),
        ('fsl_group_btw', 'fsl_group_btw.gfeat'),
        ('fsl_group_ols', 'fsl_OLS_t_test.gfeat'),
        ('fsl_group_wls', 'fsl_t_test.gfeat'),
        ('fsl_hrf_fir', 'fsl_FIR_basis.feat'),
        ('fsl_hrf_gammadiff', 'fsl_double_gamma.feat'),
        ('fsl_thr_clustfwep05', 'fsl_cluster_p005.feat'),
        ('fsl_thr_voxelfwep05', 'fsl_FWE_p005.feat'),
    )

    for name, feat_dir in studies:
        run_feat(name, feat_dir)
