# git-job.sh

Basic Jenkins Job with SVN using Freestyle Project

This repository serves as a guide for beginners to set up a basic Jenkins job using a Freestyle Project with SVN (Subversion) as the version control system. Note that Jenkins and SVN are set up in separate Docker containers.
Steps:

    Create a Local Working Copy from Trunk:
        Set up your Jenkins job to pull the source code from the SVN trunk.
        Configure the Jenkins job to perform a checkout operation, creating a local working copy of the code from the trunk.

    Merge Code from Branch to Local Working Copy:
        Implement a build step in your Jenkins job to merge code changes from a specific SVN branch into the local working copy.
        Ensure that Jenkins has the necessary permissions to access the SVN repository and perform merge operations.

    Create a Backup for Successful Merges:
        Configure Jenkins to create a backup of the successfully merged code after each successful build.
        This backup can serve as a snapshot of the codebase at a particular point in time and can be useful for reverting changes if necessary.
