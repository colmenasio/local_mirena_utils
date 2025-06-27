#!/bin/zsh 


setopt CSH_NULL_GLOB
lmu_commands=(${LMU_DIR}/command/*.bash)
unsetopt CSH_NULL_GLOB

for command_path in $lmu_commands;
do
	if [ -x $command_path ]; then
		command_name=$(basename $command_path .bash)
		alias ${command_name}=${command_path}
	fi
done

