Setting up your munki_repo on Ubuntu and configuring munkireport-php
=========

There's a great step-by-step writeup by [Clayton Burlison](https://github.com/clburlison) available on his [Blog](https://clburlison.com), which will walk you trough setting up your munki_repo, configuring nginx and munkireport-php. You can find his articles here:

* [Setup a Munki repo on Ubuntu 14.04 - Part 1](https://clburlison.com/munkirepo-guide-part-1/)
* [Setup Mandrill on Ubuntu 14.04 - Part 2](https://clburlison.com/munkirepo-guide-part-2/)
* [Setup Munkireport on Ubuntu 14.04 - Part 3](https://clburlison.com/munkirepo-guide-part-3/)

> While in principal my setup follows steps highlighted in Clayton's writeup, I've adapted some of the steps mentioned in Clayton's setup tutorial to match our specific requirements
> The 'ubuntu_munki' script here should help configure nginx, samba and the munki_repo on your Ubuntu server. It will also download munkireport-php. You'll still need to download and configure MySQL and the config.php file for munkireport-php in order to get everything to work.

Changes I've had to make to match our environment needs
> 1. Add relevant ports to _iptables_:
  > In my current environment firewall rules are monitored and maintained by Puppet. As such, port 80 is restricted by default
> 2. Creating a local user on the server that will administer Munki:
  > User accounts are created and bound to AD by puppet. So we need a local  admin account that multiple Admins can use. Alternatively you could add all Admin accounts to the machine and associate them with the _munki_ group.
> 3. Configuring Samba & defining the 'Default' config for Nginx:
  > Although you can edit the options within the script to setup your samba volume, I've ended up doing this via a puppet module. 
