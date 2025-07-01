#!/bin/bash

cd ${MIRENA_WS_DIR}

[ -d ./build ] && rm ./build -fr
[ -d ./log ] && rm ./log -fr
[ -d ./install ] && rm ./install -fr

echo "Wiped Last Build Succesfully. Exit this terminal session and open a new one to update the local setup"

