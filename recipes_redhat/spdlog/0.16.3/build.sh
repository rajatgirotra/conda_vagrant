#!/usr/bin/env bash

SRC_DIR=$(basename ${PWD})
cmake -H. -B_builds -DSPDLOG_BUILD_EXAMPLES=ON -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=Release
cmake --build _builds --target install

#cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} ../${SRC_DIR}/
#make all
#make install

