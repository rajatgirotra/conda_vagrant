#!/usr/bin/env bash

./configure --prefix=${PREFIX} --with-system-readline
make
make -C gdb install
