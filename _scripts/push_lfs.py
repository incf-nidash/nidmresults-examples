""" Push all the files stored with git-lfs that were modified as part of a
given commit. This is useful when something went wrong and the files have to be
pushed again to the server. It is an intermediate solution between re-pushing
all objects in a branch (--all option of git-lfs push) and re-pushing a single
object (--object-id option of git-lfs push)

Camille Maumet
"""

from subprocess import check_call, check_output
import argparse

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description='Push git-lfs files associated with a given commit.')
    parser.add_argument('sha', help='Commit sha-sum.')
    args = parser.parse_args()

    # List all files modified by that commit
    up_files = check_output([
        "git diff-tree --no-commit-id --name-only -r " + args.sha], shell=True)
    up_files = up_files.split("\n")

    # List all files stored by git-lfs for the commit 'sha'
    lfs_files = check_output(["git-lfs ls-files -l " + args.sha], shell=True)

    # Get git-lfs objects ids
    lfs_files = dict(
        (v, n) for n, v in
        (a.split(' * ') for a in lfs_files.split("\n") if "*" in a))

    # Re-push all git-lfs files
    for up_file in up_files:
        if up_file in lfs_files:
            osha = lfs_files[up_file]
            check_call(["git-lfs push origin --object-id " + osha], shell=True)
