#!/bin/bash

# Note provisioning is run as root user but current working dir is
# /home/vagrant
echo "Ubuntu Provisioning"
sudo apt-get update
sudo apt-get install -y g++ libsqlite3-dev libbz2-dev libreadline-dev zlib1g-dev libssl-dev libgdbm-dev build-essential libncurses5-dev tk-dev libxml2-dev libxslt1-dev texinfo libc6-dev-i386 zip unzip gfortran liblapack-dev libblas-dev m4

DEFAULT_USER=ubuntu

MINICONDA_FILE=Miniconda-latest-Linux-x86_64.sh
CONDA_INSTALL_DIR=/home/${DEFAULT_USER}/miniconda2
CONDA_BUILD_DIR=/home/${DEFAULT_USER}/conda_builds
CONDA=${CONDA_INSTALL_DIR}/bin/conda

su - ${DEFAULT_USER} <<EOF
[[ -e ${MINICONDA_FILE} ]] && rm "${MINICONDA_FILE}"
echo "Downloading Miniconda"
wget --quiet https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
chmod 755 /home/${DEFAULT_USER}/${MINICONDA_FILE}
rm -rf /home/${DEFAULT_USER}/miniconda2
echo "Installing Miniconda"
/home/${DEFAULT_USER}/${MINICONDA_FILE} -b
echo 'export PATH=\${PATH}:/home/ubuntu/miniconda2/bin' >> /home/${DEFAULT_USER}/.bashrc

echo "Installing argcomplete"
${CONDA} install --quiet --yes argcomplete
echo 'eval "\$(register-python-argcomplete conda)"' >> /home/${DEFAULT_USER}/.bashrc
echo "Installing conda-build"
${CONDA} install --quiet --yes conda-build

[[ -d ${CONDA_BUILD_DIR} ]] && rm -rf "${CONDA_BUILD_DIR}"
mkdir -p "${CONDA_BUILD_DIR}"/linux-64

m4 -DDEFAULT_USER=${DEFAULT_USER} /vagrant/condarc.macro > /home/${DEFAULT_USER}/.condarc
#cp /vagrant/condarc /home/${DEFAULT_USER}/.condarc
chmod 644 /home/${DEFAULT_USER}/.condarc
EOF

sudo chown ${DEFAULT_USER}:${DEFAULT_USER} /home/${DEFAULT_USER}/.condarc
# For Python Conda recipe
#./configure --prefix=/home/vagrant/tools/python/2.7.11 --with-cxx-main=/usr/bin/g++  --enable-shared --with-ensurepip=yes --enable-unicode=ucs4
# wget http://downloads.sourceforge.net/scons/scons-2.4.1.tar.gz
# tar -xvzf scons-
# python setup.py install
