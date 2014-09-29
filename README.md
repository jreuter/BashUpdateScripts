# BashUpdateScripts
Scripts to check for the Shellshock vulnerability and update Bash on an
Ubuntu system that has been retired.

## Requirements
The system will have to have the packages 'build-essential' and 'patch'
installed to run--these will be requested at runtime.  A user may also
run the `addSources.sh` script to install these packages on a retired
Ubuntu system.

		sudo ./addSources.sh
		sudo apt-get update
		sudo apt-get install build-essential patch

# Execution
This script will detect and attempt to patch a vulnerable system,
using the latest-available version of Bourne Shell.

		sudo ./updateBash.sh
