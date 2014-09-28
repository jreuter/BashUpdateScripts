#!/bin/bash
echo "Patching vulnerable system"


echo "Adding sources and requirements"
sudo ./addSources.sh
sudo apt-get update
sudo apt-get install build-essential patch

SOURCES=/etc/apt/sources.list
CODENAME=$(cat /etc/apt/sources.list | grep us.archive.ubuntu.com | head -n1 | awk '{print $3}')

echo "Adding backport repository sources for $CODENAME in $SOURCES."

# These sources came from here:
# https://help.ubuntu.com/community/EOLUpgrades#Requirements

cat << HEREDOC >> $SOURCES

## EOL upgrade sources.list
# Required
deb http://old-releases.ubuntu.com/ubuntu/ $CODENAME main restricted universe multiverse
deb http://old-releases.ubuntu.com/ubuntu/ $CODENAME-updates main restricted universe multiverse
deb http://old-releases.ubuntu.com/ubuntu/ $CODENAME-security main restricted universe multiverse

# Optional
#deb http://old-releases.ubuntu.com/ubuntu/ $CODENAME-backports main restricted universe multiverse

HEREDOC

