#!/bin/bash

# I got this command to test bash from here: 
# http://arstechnica.com/security/2014/09/bug-in-bash-shell-creates-big-security-hole-on-anything-with-nix-in-it/
env x='() { :;}; echo vulnerable' bash -c "echo this is a test"

