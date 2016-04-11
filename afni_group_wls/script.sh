# t-test analysis
3dMEMA -prefix 3dMEMA_result       \
          -setA setA                   \
             01 stats.sub_001+tlrc'tone_counting#0_Coef' stats.sub_001+tlrc'tone_counting#0_Tstat' \
             02 stats.sub_002+tlrc'tone_counting#0_Coef' stats.sub_001+tlrc'tone_counting#0_Tstat' \
             03 stats.sub_003+tlrc'tone_counting#0_Coef' stats.sub_001+tlrc'tone_counting#0_Tstat' \
             04 stats.sub_004+tlrc'tone_counting#0_Coef' stats.sub_001+tlrc'tone_counting#0_Tstat' \
             05 stats.sub_005+tlrc'tone_counting#0_Coef' stats.sub_001+tlrc'tone_counting#0_Tstat' \
             06 stats.sub_006+tlrc'tone_counting#0_Coef' stats.sub_001+tlrc'tone_counting#0_Tstat' \
             07 stats.sub_007+tlrc'tone_counting#0_Coef' stats.sub_001+tlrc'tone_counting#0_Tstat' \
             08 stats.sub_008+tlrc'tone_counting#0_Coef' stats.sub_001+tlrc'tone_counting#0_Tstat' \
             09 stats.sub_009+tlrc'tone_counting#0_Coef' stats.sub_001+tlrc'tone_counting#0_Tstat' \
             10 stats.sub_010+tlrc'tone_counting#0_Coef' stats.sub_001+tlrc'tone_counting#0_Tstat' \
             11 stats.sub_011+tlrc'tone_counting#0_Coef' stats.sub_001+tlrc'tone_counting#0_Tstat' \
             12 stats.sub_012+tlrc'tone_counting#0_Coef' stats.sub_001+tlrc'tone_counting#0_Tstat' \
             13 stats.sub_013+tlrc'tone_counting#0_Coef' stats.sub_001+tlrc'tone_counting#0_Tstat' \
             14 stats.sub_014+tlrc'tone_counting#0_Coef' stats.sub_001+tlrc'tone_counting#0_Tstat'

# Create a group mask
3dMean -mask_inter -prefix mask `ls input/sub_0*/mask_*.HEAD`             
        
# Simulations for FWE corrected cluster-size inference
# 5.920743571     5.799465714 6.732922143 is the average of second line
# in blur_est.sub_xxx.1D over the 14 subjects
3dClustSim -both -mask mask+tlrc -fwhmxyz 5.920743571   5.799465714 6.732922143 -prefix ClustSim 