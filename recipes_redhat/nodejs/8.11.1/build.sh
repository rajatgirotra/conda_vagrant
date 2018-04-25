#!/usr/bin/env bash

chmod +x configure
./configure --prefix=$PREFIX --tag='Rajat_Internal_Nodejs_build'
make
make install

