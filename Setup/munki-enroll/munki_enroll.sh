#!/bin/sh 
 
IDENTIFIER=$( defaults read /Library/Preferences/ManagedInstalls ClientIdentifier ); 
HOSTNAME=$( scutil --get ComputerName );

# Specify path to your enroll.php script
SUBMITURL="http://<your server FQDN>/munki_repo/munki-enroll/enroll.php"

# Application paths
CURL="/usr/bin/curl"

$CURL --max-time 5 --silent --get \
    -d hostname="$HOSTNAME" \
    -d identifier="$IDENTIFIER" \
    "$SUBMITURL"
 	
IDENTIFIER_PATH=$( echo "$IDENTIFIER" | sed 's/\/[^/]*$//' ); 
 	
defaults write /Library/Preferences/ManagedInstalls ClientIdentifier "$IDENTIFIER_PATH/clients/$HOSTNAME"
 
exit 0
