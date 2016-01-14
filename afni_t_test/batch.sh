3dttest++ -prefix ttest++_result       \
          -setA setA                   \
             01 "Sub01_con0001.nii[0]" \
             02 "Sub02_con0001.nii[0]" \
             03 "Sub03_con0001.nii[0]" \
             04 "Sub04_con0001.nii[0]" \
             05 "Sub05_con0001.nii[0]" \
             06 "Sub06_con0001.nii[0]" \
             07 "Sub07_con0001.nii[0]" \
             08 "Sub08_con0001.nii[0]" \
             09 "Sub09_con0001.nii[0]" \
             10 "Sub10_con0001.nii[0]" \
             11 "Sub11_con0001.nii[0]" \
             12 "Sub12_con0001.nii[0]" \
             13 "Sub13_con0001.nii[0]" \
             14 "Sub14_con0001.nii[0]" 

 3dclust -1Dformat -nosum -1dindex 0 -1tindex 1 -2thresh -4.221 4.221 -dxyz=1 1.01 2 ./ttest++_result+tlrc.HEAD
