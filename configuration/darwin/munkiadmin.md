## Setting up MunkiAdmin
> MunkiAdmin is a GUI that enables administrators to edit package deployment settings,catalogs and manifests. .
> * Official documentation for MunkiAdmin is available [here] (https://github.com/hjuutilainen/munkiadmin)
> * Latest releases are available [here] (https://github.com/hjuutilainen/munkiadmin/releases/)
> Once you've downloaded the latest version of MunkiAdmin, move the app to your Applications folder and launch the app.

## Using MunkiAdmin
> At first launch, you'll be asked to spexify the location of your **munki_repo**. To do this use the GUI to navigate to your repo location and click okay. By default MunkiAdmin will ask you to specify a repo location each time it is launched. You can change this setting.
>
> * Click on 'MunkiAdmin' on the top-left corner of your screen
> * Click on 'Preferences' in the drop down menu
>  * In the panel that opens, change 'On Startup' setting to 'Open Previous Repository'
>
> The GUI is now configured. Once you import packages to your munki_repo you will see them populate your GUI. Then you can add/edit catalogs and manifests based on client requirements.
> * **Note:** If you import packages or rebuild catalogs using CLI you'll need to `make, save and reload` your MunkiAdmin catalog. 
