#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${DIR}/utils/root_check.sh
source ${DIR}/utils/log_errors.sh

# I got this command to test bash from here:
# http://arstechnica.com/security/2014/09/bug-in-bash-shell-creates-big-security-hole-on-anything-with-nix-in-it/
env x="() { :;}; echo 'This machine is vulnerable.  Please run ./updateBash.sh to patch.'" bash -c "echo this is a test"
