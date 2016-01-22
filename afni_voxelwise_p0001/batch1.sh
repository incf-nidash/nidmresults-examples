#!/usr/bin/env tcsh

# created by uber_subject.py: version 0.37 (April 14, 2015)
# creation date: Tue Jan 19 11:54:24 2016

# set data directories
set top_dir   =                                                         \
    /Users/u1591557/Documents/Single_Subject_Analysis/DS000006_data/sub001
set anat_dir  = $top_dir/anatomy
set epi_dir   = $top_dir/BOLD/task001_run001
set stim_dir  =                                                         \
    $top_dir/model/model001/onsets/task001_run001/Stimulus_timing_files_AFNI

# set subject and group identifiers
set subj      = sub001_run1
set group_id  = DS000006

# run afni_proc.py to create a single subject processing script

3drefit -TR 2 $epi_dir/bold.nii                                                   
afni_proc.py -subj_id $subj                                             \
        -script proc.$subj -scr_overwrite                               \
        -blocks tshift align blur mask scale regress               \
        -copy_anat $anat_dir/mprage_defaced.nii                         \
        -tcat_remove_first_trs 0                                        \
        -dsets $epi_dir/bold.nii                                        \
        -blur_size 4.0                                                  \
        -regress_stim_times                                             \
            $stim_dir/cond001_onset_times.txt                           \
            $stim_dir/cond002_onset_times.txt                           \
            $stim_dir/cond003_onset_times.txt                           \
            $stim_dir/cond004_onset_times.txt                           \
        -regress_stim_labels                                            \
            mr_sw mr_ns pl_sw pl_ns                                     \
        -regress_basis 'BLOCK(3.25,1)'                                  \
        -regress_opts_3dD                                               \
            -gltsym 'SYM: mr_sw +mr_ns -pl_sw -pl_ns' -glt_label 1 M-P  \
            -gltsym 'SYM: mr_sw -mr_ns +pl_sw -pl_ns' -glt_label 2 S-NS \
            -gltsym 'SYM: mr_sw -mr_ns' -glt_label 3 S-NS_M             \
            -gltsym 'SYM: pl_sw -pl_ns' -glt_label 4 S-NS_P             \
        -regress_make_ideal_sum sum_ideal.1D                            \
        -regress_est_blur_epits                                         \
        -regress_est_blur_errts

 3dclust -1Dformat -nosum -1dindex 14 -1tindex 14 -2thresh -3.341 3.341 -inmask -dxyz=1 1.01 2 ./sub001_run1.results/stats.sub001_run1+tlrc.HEAD
