#!/bin/bash


# Parse arguments
files=()
while [[ $# -gt 0 ]]; do
    case "$1" in
        -c)
	    do_clean=true
            shift
            ;;
        *)
            args+=("$1")
            shift
            ;;
    esac
done

# CD to the ws directory
[ -z ${MIRENA_WS_DIR} ] || cd ${MIRENA_WS_DIR}

# Fully remove and rebuild ros packages
for pkg in ${args[@]};
do
	if [ $do_clean ]; then
		echo "Cleaning old build"
		rm -fr ${MIRENA_WS_DIR}/install/${pkg} || echo "$pkg not found in install"
		rm -fr ${MIRENA_WS_DIR}/build/${pkg} || echo "$pkg not found in build"
	fi
	colcon build --packages-select $pkg --allow-overriding $pkg --parallel-workers 16
done

# Source again the ros local setup
source ${MIRENA_WS_DIR}/install/local_setup.bash

