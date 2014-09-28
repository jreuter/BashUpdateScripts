# BashUpdateScripts

Scripts to check for the Shellshock vulnerability and update Bash on an
Ubuntu system that has been retired.

## Testing

First a user may want to run the `testBash.sh` script to determine if their
system if vulnerable to 'shellshock'.

### Vulnerable Result

		vulnerable
		this is a test

### Desired Result

		bash: warning: x: ignoring function definition attempt
		bash: error importing function definition for `x'
		this is a test	

## Requirements

The system will have to have the packages 'build-essential' and 'patch'
installed to run.  A user can run the `addSources.sh` script to install these
packages on a retired Ubuntu system.

		sudo ./addSources.sh
		sudo apt-get update
		sudo apt-get install build-essential patch

## Update Bash

This script will use `wget` to download Bash 4.3 and all related patches.
Then compile and install the new version.

		sudo ./updateBash.sh

