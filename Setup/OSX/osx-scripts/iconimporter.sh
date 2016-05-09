#!/bin/sh

# Script to setup icon importer function for Munki Admin
curl -O https://munki.googlecode.com/git-history/Munki2/code/client/iconimporter

# Move and rename iconimporter
mv iconimporter /usr/local/munki/iconimporter.py

# modify permissions
chmod +x /usr/local/munki/iconimporter.py

# Navigate to munki directory and run icon importer
cd /usr/local/munki
./iconimporter.py /Volumes/<your_volume_name>/Munki/munki_repo

exit 0
