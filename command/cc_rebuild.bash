#!/bin/bash

# Fully remove and rebuild ros packages
for pkg in $@;
do
	rm -fr ${MIRENA_WS_DIR}/install/${pkg} || echo "$pkg not found in install"
	rm -fr ${MIRENA_WS_DIR}/build/${pkg} || echo "$pkg not found in build"

	colcon build --packages-select $pkg --allow-overriding $pkg
done

# Source again the ros local setup
source ${MIRENA_WS_DIR}/install/local_setup.bash

