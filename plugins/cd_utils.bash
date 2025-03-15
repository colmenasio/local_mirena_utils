#!/bin/bash

cd_ws() {
    LMU_LAST_PATH="$PWD"
    cd "${MIRENA_WS_DIR}"
}
alias ws=cd_ws

cd_lmu() {
    LMU_LAST_PATH="$PWD"
    cd "${LMU_DIR}"
}

cd_back() {
    [ -n "$LMU_LAST_PATH" ] && cd "$LMU_LAST_PATH"
}

