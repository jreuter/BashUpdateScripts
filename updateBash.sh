#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${DIR}/utils/root_check.sh
source ${DIR}/utils/log_errors.sh

# Add sources for old versions of Ubuntu and install pre-reqs.
${DIR}/addSources.sh

# This code came from here:
# http://superuser.com/questions/816787/how-do-i-patch-the-shellshock-vulnerability-on-an-obsolete-ubuntu-system-that-i

mkdir src
cd src
wget http://ftp.gnu.org/gnu/bash/bash-4.3.tar.gz

# Download all patches.
for i in $(seq -f "%03g" 0 26); do wget http://ftp.gnu.org/gnu/bash/bash-4.3-patches/bash43-${i}; done
tar zxvf bash-4.3.tar.gz 
cd bash-4.3

# Apply all patches.
for i in $(seq -f "%03g" 0 26);do patch -p0 < ../bash43-${i}; done

# Build and install.
./configure --prefix=/ && make && make install
cd ${DIR} 
rm -r src

