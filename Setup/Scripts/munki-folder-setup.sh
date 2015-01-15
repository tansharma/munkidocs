#!/bin/sh

# This script will create the required folders for Munki and then create a symlink between
# your munki_repo directory and the default directory used by your web server. Our puppet
# managed workstations create a Volume called LocalDataHD which stores the local user profile. 
# This Volume may be different on other deployments, and should be edited as necessary.

# Navigate to LocalDataHD on your server machine
cd /Volumes/LocalDataHD

# Create a directory called Munki, with a sub directory called munki_repo. Within munki_repo
# create sub folders that will contain catalogs, manifests, packages and package information.
mkdir Munki
mkdir Munki/munki_repo
mkdir Munki/munki_repo/catalogs
mkdir Munki/munki_repo/manifests
mkdir Munki/munki_repo/pkgs
mkdir Munki/munki_repo/pkgsinfo

# Modify permissions for directory munki_repo
chmod -R a+rX /Volumes/LocalDataHD/Munki/munki_repo

exit 0
