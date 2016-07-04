%-----------------------------------------------------------------------
% Job saved on 12-Apr-2016 15:08:35 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (12.1)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_move.files = {'/storage/essicd/data/NIDM-Ex/BIDS_Data/DATA/BIDS/ds011/sub-01/func/sub-01_task-tonecounting_bold.nii.gz'};
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_move.action.copyto = {'/storage/essicd/data/NIDM-Ex/BIDS_Data/RESULTS/EXAMPLES/ds011/SPM/PREPROCESSING/FUNCTIONAL'};
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_move.files = {'/storage/essicd/data/NIDM-Ex/BIDS_Data/DATA/BIDS/ds011/sub-01/anat/sub-01_T1w.nii.gz'};
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_move.action.copyto = {'/storage/essicd/data/NIDM-Ex/BIDS_Data/RESULTS/EXAMPLES/ds011/SPM/PREPROCESSING/ANATOMICAL'};
matlabbatch{3}.cfg_basicio.file_dir.file_ops.cfg_gunzip_files.files(1) = cfg_dep('Move/Delete Files: Moved/Copied Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{4}.cfg_basicio.file_dir.file_ops.cfg_gunzip_files.files(1) = cfg_dep('Move/Delete Files: Moved/Copied Files', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{5}.spm.spatial.realign.estwrite.data{1}(1) = cfg_dep('GunZip Files: GunZipped Files', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{':'}));
matlabbatch{5}.spm.spatial.realign.estwrite.eoptions.quality = 0.9;
matlabbatch{5}.spm.spatial.realign.estwrite.eoptions.sep = 4;
matlabbatch{5}.spm.spatial.realign.estwrite.eoptions.fwhm = 5;
matlabbatch{5}.spm.spatial.realign.estwrite.eoptions.rtm = 1;
matlabbatch{5}.spm.spatial.realign.estwrite.eoptions.interp = 2;
matlabbatch{5}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
matlabbatch{5}.spm.spatial.realign.estwrite.eoptions.weight = '';
matlabbatch{5}.spm.spatial.realign.estwrite.roptions.which = [0 1];
matlabbatch{5}.spm.spatial.realign.estwrite.roptions.interp = 4;
matlabbatch{5}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
matlabbatch{5}.spm.spatial.realign.estwrite.roptions.mask = 1;
matlabbatch{5}.spm.spatial.realign.estwrite.roptions.prefix = 'r';
matlabbatch{6}.spm.spatial.coreg.estimate.ref(1) = cfg_dep('Realign: Estimate & Reslice: Mean Image', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','rmean'));
matlabbatch{6}.spm.spatial.coreg.estimate.source(1) = cfg_dep('GunZip Files: GunZipped Files', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{':'}));
matlabbatch{6}.spm.spatial.coreg.estimate.other = {''};
matlabbatch{6}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
matlabbatch{6}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
matlabbatch{6}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{6}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
matlabbatch{7}.spm.spatial.preproc.channel.vols(1) = cfg_dep('GunZip Files: GunZipped Files', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{':'}));
matlabbatch{7}.spm.spatial.preproc.channel.biasreg = 0.001;
matlabbatch{7}.spm.spatial.preproc.channel.biasfwhm = 60;
matlabbatch{7}.spm.spatial.preproc.channel.write = [0 1];
matlabbatch{7}.spm.spatial.preproc.tissue(1).tpm = {'/storage/essicd/data/NIDM-Ex/spm12_update/tpm/TPM.nii,1'};
matlabbatch{7}.spm.spatial.preproc.tissue(1).ngaus = 1;
matlabbatch{7}.spm.spatial.preproc.tissue(1).native = [1 0];
matlabbatch{7}.spm.spatial.preproc.tissue(1).warped = [0 0];
matlabbatch{7}.spm.spatial.preproc.tissue(2).tpm = {'/storage/essicd/data/NIDM-Ex/spm12_update/tpm/TPM.nii,2'};
matlabbatch{7}.spm.spatial.preproc.tissue(2).ngaus = 1;
matlabbatch{7}.spm.spatial.preproc.tissue(2).native = [1 0];
matlabbatch{7}.spm.spatial.preproc.tissue(2).warped = [0 0];
matlabbatch{7}.spm.spatial.preproc.tissue(3).tpm = {'/storage/essicd/data/NIDM-Ex/spm12_update/tpm/TPM.nii,3'};
matlabbatch{7}.spm.spatial.preproc.tissue(3).ngaus = 2;
matlabbatch{7}.spm.spatial.preproc.tissue(3).native = [1 0];
matlabbatch{7}.spm.spatial.preproc.tissue(3).warped = [0 0];
matlabbatch{7}.spm.spatial.preproc.tissue(4).tpm = {'/storage/essicd/data/NIDM-Ex/spm12_update/tpm/TPM.nii,4'};
matlabbatch{7}.spm.spatial.preproc.tissue(4).ngaus = 3;
matlabbatch{7}.spm.spatial.preproc.tissue(4).native = [1 0];
matlabbatch{7}.spm.spatial.preproc.tissue(4).warped = [0 0];
matlabbatch{7}.spm.spatial.preproc.tissue(5).tpm = {'/storage/essicd/data/NIDM-Ex/spm12_update/tpm/TPM.nii,5'};
matlabbatch{7}.spm.spatial.preproc.tissue(5).ngaus = 4;
matlabbatch{7}.spm.spatial.preproc.tissue(5).native = [1 0];
matlabbatch{7}.spm.spatial.preproc.tissue(5).warped = [0 0];
matlabbatch{7}.spm.spatial.preproc.tissue(6).tpm = {'/storage/essicd/data/NIDM-Ex/spm12_update/tpm/TPM.nii,6'};
matlabbatch{7}.spm.spatial.preproc.tissue(6).ngaus = 2;
matlabbatch{7}.spm.spatial.preproc.tissue(6).native = [0 0];
matlabbatch{7}.spm.spatial.preproc.tissue(6).warped = [0 0];
matlabbatch{7}.spm.spatial.preproc.warp.mrf = 1;
matlabbatch{7}.spm.spatial.preproc.warp.cleanup = 1;
matlabbatch{7}.spm.spatial.preproc.warp.reg = [0 0.001 0.5 0.05 0.2];
matlabbatch{7}.spm.spatial.preproc.warp.affreg = 'mni';
matlabbatch{7}.spm.spatial.preproc.warp.fwhm = 0;
matlabbatch{7}.spm.spatial.preproc.warp.samp = 3;
matlabbatch{7}.spm.spatial.preproc.warp.write = [0 1];
matlabbatch{8}.spm.spatial.normalise.write.subj.def(1) = cfg_dep('Segment: Forward Deformations', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','fordef', '()',{':'}));
matlabbatch{8}.spm.spatial.normalise.write.subj.resample(1) = cfg_dep('Realign: Estimate & Reslice: Realigned Images (Sess 1)', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','cfiles'));
matlabbatch{8}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                          78 76 85];
matlabbatch{8}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
matlabbatch{8}.spm.spatial.normalise.write.woptions.interp = 4;
matlabbatch{8}.spm.spatial.normalise.write.woptions.prefix = 'w';
matlabbatch{9}.spm.spatial.normalise.write.subj.def(1) = cfg_dep('Segment: Forward Deformations', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','fordef', '()',{':'}));
matlabbatch{9}.spm.spatial.normalise.write.subj.resample(1) = cfg_dep('Segment: Bias Corrected (1)', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','channel', '()',{1}, '.','biascorr', '()',{':'}));
matlabbatch{9}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                          78 76 85];
matlabbatch{9}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
matlabbatch{9}.spm.spatial.normalise.write.woptions.interp = 4;
matlabbatch{9}.spm.spatial.normalise.write.woptions.prefix = 'w';
matlabbatch{10}.spm.spatial.smooth.data(1) = cfg_dep('Normalise: Write: Normalised Images (Subj 1)', substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
matlabbatch{10}.spm.spatial.smooth.fwhm = [6 6 6];
matlabbatch{10}.spm.spatial.smooth.dtype = 0;
matlabbatch{10}.spm.spatial.smooth.im = 0;
matlabbatch{10}.spm.spatial.smooth.prefix = 's';
matlabbatch{11}.spm.stats.fmri_spec.dir = {'/storage/essicd/data/NIDM-Ex/BIDS_Data/RESULTS/TEST/nidmresults-examples/spm_cluster_p005'};
matlabbatch{11}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{11}.spm.stats.fmri_spec.timing.RT = 2;
matlabbatch{11}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{11}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
matlabbatch{11}.spm.stats.fmri_spec.sess.scans(1) = cfg_dep('Smooth: Smoothed Images', substruct('.','val', '{}',{10}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{11}.spm.stats.fmri_spec.sess.cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{11}.spm.stats.fmri_spec.sess.multi = {'/storage/essicd/data/NIDM-Ex/BIDS_Data/RESULTS/EXAMPLES/ds011/SPM/PREPROCESSING/ONSETS/sub-01-MultiCond.mat'};
matlabbatch{11}.spm.stats.fmri_spec.sess.regress = struct('name', {}, 'val', {});
matlabbatch{11}.spm.stats.fmri_spec.sess.multi_reg = {''};
matlabbatch{11}.spm.stats.fmri_spec.sess.hpf = 128;
matlabbatch{11}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{11}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{11}.spm.stats.fmri_spec.volt = 1;
matlabbatch{11}.spm.stats.fmri_spec.global = 'None';
matlabbatch{11}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{11}.spm.stats.fmri_spec.mask = {''};
matlabbatch{11}.spm.stats.fmri_spec.cvi = 'AR(1)';
matlabbatch{12}.spm.stats.fmri_est.spmmat(1) = cfg_dep('fMRI model specification: SPM.mat File', substruct('.','val', '{}',{11}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{12}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{12}.spm.stats.fmri_est.method.Classical = 1;
matlabbatch{13}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{12}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{13}.spm.stats.con.consess{1}.tcon.name = 'tone counting vs baseline';
matlabbatch{13}.spm.stats.con.consess{1}.tcon.weights = [1 0];
matlabbatch{13}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch{13}.spm.stats.con.delete = 0;
matlabbatch{14}.spm.stats.results.spmmat(1) = cfg_dep('Contrast Manager: SPM.mat File', substruct('.','val', '{}',{13}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{14}.spm.stats.results.conspec.titlestr = '';
matlabbatch{14}.spm.stats.results.conspec.contrasts = Inf;
matlabbatch{14}.spm.stats.results.conspec.threshdesc = 'none';
matlabbatch{14}.spm.stats.results.conspec.thresh = 0.001;
matlabbatch{14}.spm.stats.results.conspec.extent = 116;
matlabbatch{14}.spm.stats.results.conspec.conjunction = 1;
matlabbatch{14}.spm.stats.results.conspec.mask.none = 1;
matlabbatch{14}.spm.stats.results.units = 1;
matlabbatch{14}.spm.stats.results.print = 'pdf';
matlabbatch{14}.spm.stats.results.write.tspm.basename = 'thresh';