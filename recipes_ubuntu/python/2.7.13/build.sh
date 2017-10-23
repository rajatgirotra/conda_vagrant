#!/usr/bin/env bash

PIP="${PREFIX}"/bin/pip

${PIP} install -r requirements.txt
${PIP} install --egg scons==2.4.1

TARGET=${PREFIX%/}
python fix_rpath.py ${TARGET}
