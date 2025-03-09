#!/bin/bash

# Sanity check
if [ -z $BASH_VERSION ]; then
	echo "[LMU] Source this file from a bash terminal"
	return 1;
fi

# Setup

on_error() {
    echo "[LMU] An error occurred. Exiting prematurely"
    
    trap - ERR
    set +e
    return 1;
}

trap on_error ERR
set -e

export MIRENA_WS_DIR=$(pwd)
export LMU_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# Source Ros
echo "[LMU] Sourcing ROS2"
source /opt/ros/jazzy/setup.bash
source ${MIRENA_WS_DIR}/install/local_setup.bash

# Source local plugins 
shopt -s nullglob
plugins=${LMU_DIR}/plugins/*.bash
shopt -u nullglob
echo "[LMU] Initializing Plugins"
for file in $plugins;
do
	if [ -x $file ]; then
		echo "[LMU] Loading Plugin $(basename -- $file)"
		source $file
	fi
done

# Cleanup

echo "[LMU] Cleaning up and exiting"

set +e
trap - ERR

