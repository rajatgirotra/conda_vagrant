#!/bin/bash

# Note provisioning is run as root user but current working dir is
# /home/vagrant
echo "Santiago Provisioning"
#sudo yum install -y wget vim httpd
#sudo yum groupinstall -y "Development Tools"
#sudo yum install -y texi2html texinfo
#sudo yum install -y epel-release
#sudo yum install -y htop makeself sqlite-devel readline-devel openssl-devel tk-devel bzip2-devel gdbm-devel zlib-devel ncurses-devel xz-devel libxml2-devel libxslt-devel gcc-gfortran lapack-devel blas-devel libpng-devel

#MINICONDA_FILE=Miniconda-latest-Linux-x86_64.sh
#CONDA_INSTALL_DIR=/home/vagrant/miniconda2
#CONDA_BUILD_DIR=/home/vagrant/conda_builds
#CONDA=${CONDA_INSTALL_DIR}/bin/conda

#su - vagrant <<EOF
#[[ -e "$MINICONDA_FILE" ]] && rm "$MINICONDA_FILE"
#echo "Downloading Miniconda"
#wget --quiet https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
#chmod 755 /home/vagrant/${MINICONDA_FILE}
#echo "Installing Miniconda"
#/home/vagrant/${MINICONDA_FILE} -b
#echo 'export PATH=\${PATH}:/home/vagrant/miniconda2/bin' >> /home/vagrant/.bashrc
#
#echo "Installing argcomplete"
#${CONDA} install --quiet --yes argcomplete
#echo 'eval "\$(register-python-argcomplete conda)"' >> /home/vagrant/.bashrc
#echo "Installing conda-build"
#${CONDA} install --quiet --yes conda-build
#
#[[ -d "${CONDA_BUILD_DIR}" ]] && rm -rf "${CONDA_BUILD_DIR}"
#mkdir -p "${CONDA_BUILD_DIR}"/linux-64
#cp /vagrant/condarc /home/vagrant/.condarc
#chmod 644 /home/vagrant/.condarc
#    
#echo "Enabling Apache Httpd server"
## Create softlink for Apache sharing on Centos7
#if ! [ -L /var/www ]
#  then
#    sudo rm -rf /var/www
#    sudo ln -fs /vagrant /var/www
#fi
#
#EOF
#
#sudo systemctl enable firewalld
#sudo systemctl start firewalld
#sudo firewall-cmd --permanent --add-port=80/tcp
#sudo firewall-cmd --permanent --add-port=443/tcp
#sudo firewall-cmd --reload
#sudo systemctl start httpd
#sudo systemctl enable httpd
