#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${DIR}/utils/root_check.sh
source ${DIR}/utils/log_errors.sh

SOURCES=/etc/apt/sources.list

CHECK=$(cat ${SOURCES} | grep old-releases)
if [[ -z ${CHECK} ]]; then
    echo "we are adding sources"

    CODENAME=$(cat /etc/apt/sources.list | grep us.archive.ubuntu.com | head -n1 | awk '{print $3}')

    echo "Adding backport repository sources for $CODENAME in $SOURCES."

    # These sources came from here:
    # https://help.ubuntu.com/community/EOLUpgrades#Requirements

    cat << HEREDOC >> ${SOURCES}

    ## EOL upgrade sources.list
    # Required
    deb http://old-releases.ubuntu.com/ubuntu/ $CODENAME main restricted universe multiverse
    deb http://old-releases.ubuntu.com/ubuntu/ $CODENAME-updates main restricted universe multiverse
    deb http://old-releases.ubuntu.com/ubuntu/ $CODENAME-security main restricted universe multiverse

    # Optional
    #deb http://old-releases.ubuntu.com/ubuntu/ $CODENAME-backports main restricted universe multiverse

HEREDOC

else
    echo "Sources are already in repo list."
fi

apt-get update
apt-get install build-essential patch
