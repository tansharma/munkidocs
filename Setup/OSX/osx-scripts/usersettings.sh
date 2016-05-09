#!/bin/sh

# Edit account attributes for munkiwebadmin
dscl . create /Users/munkiwebadmin home /var/empty
dscl . create /Users/munkiwebadmin passwd *

# Create a group and add munkiwebadmin to it
dseditgroup -o create -n . munki
dseditgroup -o edit -a munkiwebadmin -t user munki

# Give permissions to 'munki' group to read and write in munkiwebadmin_env
chgrp -R munki /Users/Shared/munkiwebadmin_env
chmod -R g+rw /Users/Shared/munkiwebadmin_env

# Assign group read/write access to your munki repo
chgrp -R munki /Volumes/<your_volume_name>/Munki/munki_repo
chmod -R g+rw  /Volumes/<your_volume_name>/Munki/munki_repo

exit 0
