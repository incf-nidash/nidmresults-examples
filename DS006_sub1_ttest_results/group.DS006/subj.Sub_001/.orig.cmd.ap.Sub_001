#!/usr/bin/env tcsh

# created by uber_subject.py: version 0.37 (April 14, 2015)
# creation date: Wed Jan 27 11:35:04 2016

# set data directories
set top_dir   =                                                                                           \
    /Users/u1591557/Documents/Single_Subject_Analysis_2/ds006/sub-01/ses-pre
set anat_dir  = $top_dir/anat
set epi_dir   = $top_dir/func
set stim_dir  = $top_dir/stimulus_timing_files

# set subject and group identifiers
set subj      = Sub_001
set group_id  = DS006

# run afni_proc.py to create a single subject processing script
afni_proc.py -subj_id $subj                                                                               \
        -script proc.$subj -scr_overwrite                                                                 \
        -blocks tshift align tlrc volreg blur mask scale regress                                          \
        -copy_anat $anat_dir/sub-01_ses-pre_T1w.nii                                                       \
        -tcat_remove_first_trs 0                                                                          \
        -dsets                                                                                            \
        $epi_dir/sub-01_ses-pre_task-livingnonlivingdecisionwithplainormirrorreversedtext_run-01_bold.nii \
                                                                                                          \
        -volreg_align_to third                                                                            \
        -volreg_align_e2a                                                                                 \
        -volreg_tlrc_warp                                                                                 \
        -blur_size 4.0                                                                                    \
        -regress_stim_times                                                                               \
            $stim_dir/cond001_onset_times.txt                                                             \
            $stim_dir/cond002_onset_times.txt                                                             \
            $stim_dir/cond003_onset_times.txt                                                             \
            $stim_dir/cond004_onset_times.txt                                                             \
        -regress_stim_labels                                                                              \
            mr_sw mr_ns pl_sw pl_ns                                                                       \
        -regress_basis 'BLOCK(3.25,1)'                                                                    \
        -regress_censor_motion 0.3                                                                        \
        -regress_opts_3dD                                                                                 \
            -gltsym 'SYM: mr_sw +mr_ns -pl_sw -pl_ns' -glt_label 1 M-P                                    \
            -gltsym 'SYM: mr_sw -mr_ns +pl_sw -pl_ns' -glt_label 2 S-NS                                   \
            -gltsym 'SYM: mr_sw -mr_ns' -glt_label 3 S-NS_M                                               \
            -gltsym 'SYM: pl_sw -pl_ns' -glt_label 4 S-NS_P                                               \
        -regress_make_ideal_sum sum_ideal.1D                                                              \
        -regress_est_blur_epits                                                                           \
        -regress_est_blur_errts

