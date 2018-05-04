import os
import json
from subprocess import check_call

# Directory of current script
currdir = os.path.dirname(os.path.realpath(__file__))
# Data directory
updir = os.path.dirname(currdir)

# Loop over all analyses
for dirname in  os.listdir(updir):
    if dirname not in ('fsl_con_f_multiple'):
        direc = os.path.join(updir, dirname)
        print(direc)

        config_f = os.path.join(direc, 'config.json')
        if os.path.exists(config_f):
            with open(config_f) as f:
                data = json.load(f)

            # Look up for FSL analyses
            cmd = ['nidmfsl']
            if data['software'] == 'fsl':
                print(data)

                if 'group_names' in data:
                    for i, group_name in enumerate(data['group_names']):
                        cmd.append('-g')
                        cmd.append(group_name)
                        cmd.append(str(data['num_subjects'][i]))

                cmd.append(direc)
                print(cmd)
                print('--')

                check_call(cmd)


# nidmfsl [-h] [-g GROUP_NAME NUM_SUBJECTS] [-o OUTPUT_NAME] [-d]
#                [-n NIDM_VERSION] [--version]
#                feat_dir
