""" Create a release of the "fMRI comparison database"

Camille Maumet
"""
import glob
import argparse
import shutil
import os
import tarfile

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description='Export a set of analyses as a tar.gz archives.')
    parser.add_argument(
        '-version',
        help='Version number.', default="dev")
    parser.add_argument(
        '-out_dir',
        help='Output folder.', default="../fMRI_Results_Comparison_Library")
    parser.add_argument(
        'analyses',
        help='Folder name of an analysis to be included in the data release.',
        nargs="+")

    args = parser.parse_args()
    analyses = args.analyses
    version = args.version
    out_dir = args.out_dir + "_" + version.replace(".", "_")

    soft_packages = ["afni", "spm", "fsl"]

    folders = list()
    for soft_pack in soft_packages:
        folders = folders + glob.glob(soft_pack + '_*')

    missing = (set(analyses) - set(folders))
    if missing:
        raise Exception('Missing required analyses: ' + ", ".join(missing))

    if os.path.exists(out_dir):
        msg = out_dir+" already exists, overwrite?"
        if not raw_input("%s (y/N) " % msg).lower() == 'y':
            quit("Bye.")
        if os.path.isdir(out_dir):
            shutil.rmtree(out_dir)
        else:
            os.remove(out_dir)
    os.mkdir(out_dir)

    # Copy each analysis folder as well as created a tar.gz archive of each
    # analysis folder
    for analysis in args.analyses:
        print "Exporting: " + analysis
        out_analysis_dir = os.path.join(out_dir, analysis)
        shutil.copytree(analysis, out_analysis_dir)
        with tarfile.open(out_analysis_dir + ".tar.gz", "w:gz") as tar:
            tar.add(out_analysis_dir,
                    arcname=os.path.basename(out_analysis_dir))

    # Add a readme file specifying the release version
    readme = open(os.path.join(out_dir, "readme.txt"), "w")
    readme.write("fMRI Results Comparison Library version " + version)
    readme.close()

    print "Release ready at: " + out_dir
