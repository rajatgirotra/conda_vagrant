#!/usr/bin/env bash

PIP="${PREFIX}/bin/pip3"

${PIP} install -r requirements.txt

# scons is not supported on python3
# ${PIP} install --egg scons==2.4.1

TARGET=${PREFIX%/}
python3 fix_rpath.py ${TARGET}
