#!/bin/sh

# Script to configure defaults for munkiimport

# Set your default text editor for pkginfo to Text Wrangler
defaults write com.googlecode.munki.munkiimport editor TextWrangler.app

# Set your default repo location
defaults write com.googlecode.munki.munkiimport repo_path /Volumes/LocalDataHD/Munki/munki_repo

# Set your default pkginfo extension to .plist
defaults write com.googlecode.munki.munkiimport pkginfo_extension .plist

# Set your default catalog to testing
defaults write com.googlecode.munki.munkiimport default_catalog testing

exit 0
