#!/bin/bash

colcon build --packages-select mirena_common
source "${MIRENA_WS_DIR}/install/local_setup.zsh"
colcon build --packages-skip mirena_common
source "${MIRENA_WS_DIR}/install/local_setup.zsh"

