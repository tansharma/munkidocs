# MunkiWebAdmin
> `MunkiWebAdmin` allows you to manage your catalogs and manifests online, as well as pull inventory reports about client machines and associated software.

> `NOTE` When following the instructions below, use the same Terminal window unless a new window is specified in the tasks.

# Setting up Munki Web Admin
  1. Launch Termina and become ROOT
  2. Run `virtualenv.sh` script from the Scripts folder
> When the script finishes, you will be in the `munkiwebadmin_env/munkiwebadmin` directory
   * Copy the `settings.py` from the Scripts folder into this directory
   * In your initial Terminal window run the following command: 
    `python manage.py syncdb`

> As a database doesn't exist yet, you'll be asked if you would like to create one. Type `yes` and `hit return`. You will now see a prompt to create a default admin user.
> 
  * Username (be default is user executing commands) `<change to desired username>`
* Email: `<specify an email for the account>`
* Password: `<your passowrd>`
* Password: `<confirm password>`

> At this point your superuser account will be created. You will need this account name and password to log in to the web app.

# Create a non-admin service account and group
* Open System Preferences
* Create a standard user called `munkiwebadmin`
> Go back to the original terminal window and run the usersettings script
* `./usersettings.sh`

# Start the web application
    # In the same Terminal window do the following:
	 * sudo su
	 * su munkiwebadmin
	 > Make sure you are in the correct directory
	 * pwd
> Your directory should read `/Users/Shared/munkiwebadmin_env/munkiwebadmin`
> 
> If you are not in the correct directory `cd` into it and start MunkiWebAdmin
> 
    * python manage.py runwsgiserver port=8000 host=0.0.0.0

# Test your setup
* Open Safari
* Navigate to: `http://127.0.0.1:8000`

> If you have configured the above correctly you should see a MunkiWebAdmin login page
 
* Login with the username and password you chose earlier

> Your MunkiWebServer is now up and running. However if you terminate the terminal window your server session will end. You could either leave the terminal window running or, follow later instructions to the server run persistently.

# Running MunkiWebAdmin on startup
> You can have MunkiWebAdmin run on server starup by creating a Launch Daemon plist. The code below, illustrates the function of the plist. You can find the plist configured for our MunkiWebAdmin server in the Server Setup folder.

* Copy the `com.googlecode.munki.munkiwebadmin.plist` file from the Setup folder.
* Move the file to `/Library/LaunchDaemons`
* Edit  ownership to `root:wheel` with permissions `644 (rw-r-r)`
	