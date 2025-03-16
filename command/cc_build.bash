#!/bin/bash

# Fully remove and rebuild ros packages
for pkg in $@;
do
	colcon build --packages-select $pkg --allow-overriding $pkg
done

# Source again the ros local setup
source ${MIRENA_WS_DIR}/install/local_setup.bash

