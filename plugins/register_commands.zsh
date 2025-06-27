#!/bin/zsh 


setopt CSH_NULL_GLOB
#typeset -a commands
lmu_commands=(${LMU_DIR}/command/*.bash)
echo $lmu_commands
unsetopt CSH_NULL_GLOB
echo "sanity_cgeck2"

for command_path in $lmu_commands;
do
	if [ -x $command_path ]; then
		command_name=$(basename $command_path .bash)
		alias ${command_name}=${command_path}
	fi
done

