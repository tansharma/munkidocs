munki-enroll, allows you to enroll clients as they check in with the server for the first time.
It also gives you the flexibility to to deploy common applications to all clients whilst being
able to customize applications for specific clients.

Documentation for munki-enroll can be found [here](https://github.com/edingc/munki-enroll)

How my current setup works
> To get munki-enroll going i've used the documentation available at the site listed above.
> My setup is no different from what's listed on the site, however I did have 1 issue the first
> time I set it up which has since been resolved. Only the issue and solution are documented below.

 Issue I faced with munki-enroll
> munki-enroll works extremely well straight out of the box. It looks at the host name
> of the client machine and then checks if a manifest for the client exists. If not,
> it creates a new manifest based on the host name and puts in a folder called 'clients'.
> The path to your client manifests with munki-enroll would be: /<your-munki_repo>/manifests/clients

> When a new manifest was created for my client machines, I would look at Munki Admin
> and find that there appeared to be a blank manifest under the 'included manifests' tab.
> This would give errors when checking managed software update, as the clients were effectively
> searching for a ghost manifest. If you delete this blank manifest, things work as planned
> but this is not the solution.

> Having discussed the issue with [Cody](https://github.com/edingc/munki-enroll), he mentioned that munki-enroll
> was set up such that client machines included a manifest that would provide common packages to
> all registered machines, leaving the main client manifest free for customization based on user needs.

Including your nested manifest for munki-enroll
> I have a manifest called 'common_packages' that resides in /munki_repo/manifests .
> This manifest contains common applications that I would deploy on all client
> machines as standard. To add this as a 'included manifest' as part of my munki-enroll setup,
> I did the following.

  * On line 44 (under 'Add Parent Manifest' comment): change '$identifier' to 'your-applications-manifest'

> This has been working well for me and my client machines respond as expected.

EDIT
> As we have a number of sub-domains we've made an alteration to the server side enroll.php script
> that allows us to assign additional 'manifests' based on a machines sub-domain. For an educational
> environment like our this proves to be quite handy. There's a _copy_ of the modified enroll.php file
> in the munki-enroll scripts folder. 
