#!/usr/bin/env bash

PIP="${PREFIX}/bin/pip3"

# Need to put a workaround for a too big shebang line before you can use pip.
#${PIP} install --upgrade pip
#${PIP} install six
#${PIP} install -r requirements.txt

# scons is not supported on python3
# ${PIP} install --egg scons==2.4.1

TARGET=${PREFIX%/}
python3 fix_rpath.py ${TARGET}
