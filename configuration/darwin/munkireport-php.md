# Munkireport-PHP
> A bit like MunkiWebAdmin, munkireport-php gives you an overview of your client machines and the software deployed to them. It also displays information from the System Profiler on your client machine, providing the administrator with a snapshot of the state of the machine.

> `Note` For our setup, we deploy the munkireport client package as a managed install on all clients.

# Setting up Munki Report Server
 1. In your web browser navigate [here] (https://github.com/munkireport/munkireport-php)
 2. `Download` and `Extract` the contents of the zip file
 3. Transfer all the contents of the zip folder to `/Library/Server/Web/Data/Sites/Default`
 4. Create a copy of `config_default.php` and call the new file `config.php`
 5. Modify the `config.php` file as needed
> Current modifications include `ldap authentication`, `timezone settings` , `subnet restrictions`, `module restrictions`, `notification settings` 

> Ensure you have the correct permissions for your `database`

* chown -R _www /Library/Server/Web/Data/Sites/Default/app/db

# Configuring your Munki Report Account
 1. Launch your browser and navigate to `http://127.0.0.1`
 2. Create a username and password form Munki Report
 3. Click Generate
 4. Copy the `generated hash` line (starting with $auth_config)
 5. Open `config.php` and paste the line you copied in step 4 in the file
 6. Reload your browser
 7. Enter the username and password you created in step 2 and click signin

  # Setting up a client manually
  * `sudo /bin/bash -c "$(curl -s http://<your server DNS name>/index.php?/install)"`
  
  # Setting up a client via _munki_ 
  * Create an installer `bash -c "$(curl http://<your server DNS name>/index.php?/install/)" bash -i ~/Desktop`
  * Run `/usr/local/munkiimport ~/Desktop/munkireport-x.x.x.pkg` where `x.x.x` represents the version number of the package
  * Run `makecatalogs` 

> Once your clients have installed the package, they will start reporting to
`munkireport-php` each time managed software update runs. 
> `NOTE` we currently assign 
