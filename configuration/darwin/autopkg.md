## Setup AutoPkg
> "AutoPkg is an automation framework for OS X software packaging and distribution,oriented towards the tasks one would normally perform manually to prepare third-party software for mass deployment to managed clients"
> [Source](https://github.com/autopkg/autopkg). AutoPkgr is a GUI that makes it easier to install and configure AutoPKG.
> 
> * Information related to AutoPkg [here] (https://github.com/autopkg/autopkg)
* Information related to AutoPkgr [here] (https://github.com/lindegroup/autopkgr)
* Latest release for [AutoPkg] (https://github.com/autopkg/autopkg/releases/latest)
* Latest release for [AutoPkgr] (https://github.com/lindegroup/autopkgr/releases/latest)

> If you install AutoPkg you can import packages to your 'munki_repo' via the Terminal. However, if you prefer to use the AutoPkgr App you need to ensure that 'git' & 'AutoPkg' are installed on the machine. You can install missing components from within the AutoPkgr app.


### AutoPkgr installation & configuration
> * Navigate to the latest release URL listed above and download AutoPkgr
> * Mount the DMG and move the App to your Applications folder
> * Launch AutoPkgr
>
> At this stage AutoPkgr will check if Git and Autopkg are installed on the machine. If not installed, use the install button within the app to install components
>
> * Click on `Configure Repo's and Apps` tab  
> * From `Repositories` choose the ones you would like to access
> * Select the software you would like to add to your repo.
> * Click on the `Folders & Integration` tab
> Under Munki integration - set your munki_repo location to the symlink created earlier: `/Library/Server/Web/Data/Sites/Default/munki_repo`
> * Click on the `Schedule` tab and choose how often you would like AutoPkgr to run

> AutoPkgr will now check for your selected apps and will download the required packages. Once this process is complete, you will be able to see your packages using the GUI for Munki Admin. If they dont show straightaway, click the reload button on the top. 
> You've now downloaded your first set of packages and populated your munki_repo. AutoPkgr will update these packages on the time cycle you've set. 

#### AutoPkgr & Slack
> We currently use an `integrated webhook` which provides us with a `Slack` notification every time a scheduled run occurs. `Slack` notifications can be configured in within the App. 
