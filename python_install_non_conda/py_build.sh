#!/bin/bash

set -e

#md5sum for python = 88d61f82e3616a4be952828b3694109d
MD5SUM = "88d61f82e3616a4be952828b3694109d"
PYTHON_VERSION = 2.7.12
URL = "https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz"

# download python source
curl --url ${URL} --output Python-${PYTHON_VERSION}.tgz

# valid checksum
[[ $(md5sum Python-${PYTHON_VERSION}.tgz) != MD5SUM ]] && echo "Checksum failed. Downloaded python file is likely corrupt"; exit 1

# remove current installation folder
rm -rf Python-${PYTHON_VERSION}
# untar source
tar -xvzf Python-${PYTHON_VERSION}.tgz

INSTALL_ROOT=/home/rajatgirotra/tools/python/${PYTHON_VERSION}
#export LDFLAGS="-Wl,-rpath,\\\$\$ORIGIN/../lib"
rm -rf ${INSTALL_ROOT}
mkdir -p ${INSTALL_ROOT}
cd Python-${PYTHON_VERSION}


./configure --enable-shared --enable-ipv6 --prefix=${INSTALL_ROOT} --enable-unicode=ucs4 --with-ensurepip=yes
make
make install

PIP=${INSTALL_ROOT}/bin/pip

# Fix rpath for python executable
cd ${INSTALL_ROOT}/bin
echo $(pwd)
for fil in $(ls)
do
    if file $fil | grep -q "ELF.*executable"
    then
        echo $fil
        patchelf --force-rpath --set-rpath '$ORIGIN/../lib' $fil
    fi
done

# install/upgarde packages.
${PIP} install --upgrade pip
${PIP} install virtualenv
${PIP} install -r ~/requirements.txt
${PIP} install --egg scons==2.4.1

# Fix rpath for all shared objects
python fix_rpath.py ${INSTALL_ROOT}


# [[ $(ls) != "" ]] && echo "folder \"$(ls)\" is not empty. Please choose an empty folder."; 
# makeself --gzip 2.7.12 gce_python.run.gz gce_python echo "Installing python"
