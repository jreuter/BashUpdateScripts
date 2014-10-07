# BashUpdateScripts

Scripts to check for the Shellshock vulnerability and update Bash on an
Ubuntu system that has been retired.

*Note* - This must all be run as root.

## Testing

First a user may want to run the `testBash.sh` script to determine if their
system if vulnerable to 'shellshock'.

### Vulnerable Result

		This machine is vulnerable.  Please run ./updateBash.sh to patch.
		this is a test

### Desired Result

		bash: warning: x: ignoring function definition attempt
		bash: error importing function definition for `x'
		this is a test

## Update Bash

Will check for the required packages to build Bash 4.3 (build-essentials and
patch).  If not installed, it will use apt-get to install them.  Then the
script will use `wget` to download Bash 4.3 and all related patches.  Finally,
the script will compile and install the new version.

		sudo ./updateBash.sh
