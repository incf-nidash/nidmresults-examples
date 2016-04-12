# Group analysis with weighted least squares
3dMEMA -prefix 3dMEMA_result       \
          -set controls                   \
             01 input/sub_001/stats.sub_001+tlrc['tone_counting#0_Coef'] input/sub_001/stats.sub_001+tlrc['tone_counting#0_Tstat'] \
             02 input/sub_002/stats.sub_002+tlrc['tone_counting#0_Coef'] input/sub_002/stats.sub_002+tlrc['tone_counting#0_Tstat'] \
             03 input/sub_003/stats.sub_003+tlrc['tone_counting#0_Coef'] input/sub_003/stats.sub_003+tlrc['tone_counting#0_Tstat'] \
             04 input/sub_004/stats.sub_004+tlrc['tone_counting#0_Coef'] input/sub_004/stats.sub_004+tlrc['tone_counting#0_Tstat'] \
             05 input/sub_005/stats.sub_005+tlrc['tone_counting#0_Coef'] input/sub_005/stats.sub_005+tlrc['tone_counting#0_Tstat'] \
             06 input/sub_006/stats.sub_006+tlrc['tone_counting#0_Coef'] input/sub_006/stats.sub_006+tlrc['tone_counting#0_Tstat'] \
             07 input/sub_007/stats.sub_007+tlrc['tone_counting#0_Coef'] input/sub_007/stats.sub_007+tlrc['tone_counting#0_Tstat'] \
             08 input/sub_008/stats.sub_008+tlrc['tone_counting#0_Coef'] input/sub_008/stats.sub_008+tlrc['tone_counting#0_Tstat'] \
             09 input/sub_009/stats.sub_009+tlrc['tone_counting#0_Coef'] input/sub_009/stats.sub_009+tlrc['tone_counting#0_Tstat'] \
             10 input/sub_010/stats.sub_010+tlrc['tone_counting#0_Coef'] input/sub_010/stats.sub_010+tlrc['tone_counting#0_Tstat'] \
             11 input/sub_011/stats.sub_011+tlrc['tone_counting#0_Coef'] input/sub_011/stats.sub_011+tlrc['tone_counting#0_Tstat'] \
             12 input/sub_012/stats.sub_012+tlrc['tone_counting#0_Coef'] input/sub_012/stats.sub_012+tlrc['tone_counting#0_Tstat'] \
             13 input/sub_013/stats.sub_013+tlrc['tone_counting#0_Coef'] input/sub_013/stats.sub_013+tlrc['tone_counting#0_Tstat'] \
             14 input/sub_014/stats.sub_014+tlrc['tone_counting#0_Coef'] input/sub_014/stats.sub_014+tlrc['tone_counting#0_Tstat']

# Create a group mask
3dMean -mask_inter -prefix mask `ls input/sub_*/mask_*.HEAD`             
        
# Simulations for FWE corrected cluster-size inference
# 5.920743571     5.799465714 6.732922143 is the average of second line
# in blur_est.sub_xxx.1D over the 14 subjects
3dClustSim -both -mask mask+tlrc -fwhmxyz 5.920743571   5.799465714 6.732922143 -prefix ClustSim 