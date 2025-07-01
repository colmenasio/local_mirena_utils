#!/bin/zsh

# Sanity check
if [ -z "$ZSH_VERSION" ]; then
    echo "[LMU] Source this file from a zsh terminal"
    return 1 2>/dev/null || exit 1
fi

# Setup
on_error() {
    echo "[LMU] An error occurred."
    trap - ERR
    set +e
    return 1
}

#trap on_error ERR
#set -e

export MIRENA_WS_DIR="$(pwd)"
export LMU_DIR=$(cd -- "${0:A:h}" && pwd)
export LMU_TEMP_DIR="${LMU_DIR}/temp"

# Check LMU environment is correct
[ -d "$LMU_TEMP_DIR" ] || {
    echo "[LMU] Temp directory not found, creating Temp dir"
    mkdir -p "$LMU_TEMP_DIR"
}

# Source ROS
echo "[LMU] Sourcing ROS2"
source /opt/ros/jazzy/setup.zsh
[ -d "${MIRENA_WS_DIR}/install" ] && source "${MIRENA_WS_DIR}/install/local_setup.zsh"

# Source local plugins 
echo "[LMU] Initializing Plugins"
setopt CSH_NULL_GLOB
plugins=("${LMU_DIR}"/plugins/*.zsh)
unsetopt CSH_NULL_GLOB 

for file in "${plugins[@]}"; do
    if [ -x "$file" ]; then
        echo "[LMU] Loading Plugin $(basename -- "$file")"
        source "$file"
    fi
done

# Cleanup
echo "[LMU] Cleaning up and exiting"
#set +e
#trap - ERR

