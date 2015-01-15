#!/bin/sh

# Setting up Django
echo "Navigating to your virtual environment"
cd /Users/Shared/munkiwebadmin_env
echo "Activating munkiwebadmin_env"
source bin/activate

wait

echo "Setup will now install django and django-wsgiserver"
# Install Django
pip install django==1.5.1

# Install django-wsgiserver
pip install django-wsgiserver==0.8.0beta

wait

echo "Django installation complete"
echo "Cloning munkiwebadmin to your environment"
# Copy and Configure MunkiWebAdmin
sudo git clone https://code.google.com/p/munki.munkiwebadmin/ munkiwebadmin
echo "Cloning complete"
cd munkiwebadmin

wait

echo "Creating new settings file"
# Create a copy of the settings file
cp settings_template.py settings.py

echo "Process complete. Ready to exit"
exit 0
