# Ubuntu configuration for munki_repo and munkireport-php using nginx & samba
# Will require the following manual configurations:
# MySQL , php5-fpm, & munkireport config.php
# TS , May 2016

#!/bin/bash
sudo apt-get update
sudo apt-get -y upgrade

    # Install components
    sudo apt-get -y install git curl build-essential nginx apache2-utils samba

    # Install additional components required for munkireport-php
    sudo apt-get -y install php5-fpm pfp5-mysql ph5-ldap

    # Start by setting up your munki_repo
    # My default location is '/var/local'

    REPO_PATH="/var/local/Munki/munki_repo"
    NGINX="/etc/nginx"

    sudo mkdir $REPO_PATH
    sudo mkdir -p $NGINX/sites-enabled/
    cd $REPO_PATH

    # Create the subfolder structure for munki within your repo
    sudo mkdir catalogs client_resources icons manifests pkgsinfo pkgs

    # Create a service user for munki & set permissions
    sudo addgroup --system munki
    sudo adduser --system munki --ingroup munki
    sudo usermod -a -G munki $USER
    sudo usermod -a -G munki www-data
    sudo chown -R $USER:munki $REPO_PATH
    sudo chmod -R 2774 $REPO_PATH

    # Create a backup of the default nginx file
    sudo mv $NGINX/sites-enabled/default /var/local

    # Define your server configuration for nginx & setup Samba
    # NOTE:
    # You _must_ edit the 'default' file you downloaded beforehand.
    # The 'default' file includes server settings along with settings for your
    # munki_repo path and munkireport-php. Add additional settings based on the
    # services you plan on running using nginx.

    DCONFIG="$NGINX/sites-enabled/default"
    SMBPATH="/etc/samba/smb.conf"

    # For nginx
    sudo mv default $DCONFIG

    # For samba - add's additioanl configuration to 'smb.conf'
    echo "[munki_repo]" >> "$SMBPATH"
    echo "path = <your_munki_repo_path>" >> "$SMBPATH"
    echo "available = yes" >> "#SMBPATH"
    echo "valid users = munki " >> "$SMBPATH"
    echo "read only = no" >> "$SMBPATH"
    echo "browseable = yes" >> "$SMBPATH"
    echo "public = no" >> "$SMBPATH"
    echo "writeable = yes" >> "$SMBPATH"

    # Start nginx and reload samba
    sudo /etc/init.d/nginx start
    sudo restart smbd

    # Your munki_repo should now be accessable via _samba_.
    # See your repo online: http://servername.example.com/munki_repo
    # Content listing is based on your autoindex settings (see 'default' file).
    # Access your repo via smb: smb://servername.example.com/munki_repo

    # We can now download munkireport-php
    sudo git clone https://github.com/munkireport/munkireport-php /usr/share/nginx/html/report

    # To get munkireport-php to work properly you'll need to configure
    # settings for PHP and download and configure MYSQL. See GitHub page
    # for more information.

 exit 0
