#!/usr/bin/env bash

set -x

chmod 755 configure
touch aclocal.m4 configure Makefile.am Makefile.in
SRC_DIR=$(basename ${PWD})
cd ..
mkdir objdir
cd objdir
../${SRC_DIR}/configure --prefix=${PREFIX} --enable-ipv6 --enable-samples
make
make install

