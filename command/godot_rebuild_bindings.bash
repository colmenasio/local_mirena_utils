#!/bin/bash

godot_cpp_dir="${MIRENA_WS_DIR}/src/mirena_sim/godot-cpp"
[ -d ${godot_cpp_dir} ] || { echo "${godot_cpp_dir} does not exist." ; exit 1; }

cd ${godot_cpp_dir}
scons platform=linux generate_bindings=yes

