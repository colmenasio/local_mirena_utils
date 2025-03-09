#!/bin/bash 

shopt -s nullglob
commands=${LMU_DIR}/command/*.bash
shopt -u nullglob

for command_path in $commands;
do
	if [ -x $command_path ]; then
		command_name=$(basename $command_path .bash)
		alias ${command_name}=${command_path}
	fi
done

