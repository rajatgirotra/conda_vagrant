#!/usr/bin/env bash

SRC_DIR=$(basename ${PWD})
cd ..
mkdir objdir
cd objdir
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} ../${SRC_DIR}/
make all
make install
