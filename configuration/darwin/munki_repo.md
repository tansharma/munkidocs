# The following process will help you setup your 'munki_repo' and link it to your server.
>The repo contains 4 primary sub-directories that include the catalogs, manifests, packages and associated package information. Along with this, as you progress in the setup process you'll find that icons, client resources and enroll settings are also housed with the repo.

# Creating the munki_repo directory
  1. Launch Terminal
  2. Navigate to your desired volume: cd /Volumes/`<your-volume>`

> Create a directory called 'Munki' and then a sub-directory called 'munki_repo'

  1. mkdir Munki
  2. mkdir Munki/munki_repo

# Create the 4 primary sub-directories within munki_repo
    mkdir Munki/munki_repo/catalogs
    mkdir Munki/munki_repo/manifests
    mkdir Munki/munki_repo/pkgs
    mkdir Munki/munki_repo/pkgsinfo

> Modify permissions associated with 'munki_repo'
    
    chmod -R a+rX /<your-volume>/Munki/munki_repo

> Your 'munki_repo' directory has now been setup. Now that your 'munki_repo' directory has been setup, you need to create a symbolic link between your web server's default location and your repo location. 

* Default web server location: `/Library/Server/Web/Data/Sites/Default`

>Launch Terminal and become _root_
    
    sudo ln -s /<your-volume>/Munki/munki_repo /Library/Server/Web/Data/Sites/Default

> Your symbolic link has now been created. You can verify this either by navigating to the folder or via the server app.

# Setup _munki_ to use the _repo_ you just created.
 1. Download [MunkiTools](https://github.com/munki/munki/releases/)
 2. Run the downloaded **pkg** file.

> Continue with the installation until you get the 'Customize' option. Within the 'Customize' option
  
  1. Ensure Munki Core tools is checked
  2. Ensure Munki Admin tools is checked
  3. Deselect Managed software updates (only required for client machines)
  4. Deselect LaunchD agents           (only required for client machines)
  5. Click Install.

> Once Munki tools is installed, you need to configure munkiimport settings. This will inform _munki_ of your repo path,the preferred _pkginfo_ extension, preferred _pkginfo_ editor and the name of your default catalog.

# Configuring _munkiimport_ using Terminal
  1. Launch Terminal
  2. `./usr/local/munki/munkiimport`

> Edit options as required or hit return to use default options.
