#!/bin/bash


shopt -s nullglob
pkgs=${MIRENA_WS_DIR}/src/*
shopt -u nullglob

for pkg in $pkgs;
do

	if [ -d "${pkg}" ] && [ -f "${pkg}/.git" ]; then
		echo -e "${LMU_BLACK}____________________${LMU_CYAN}[STATUS OF $(basename $pkg)]${LMU_BLACK}____________________${LMU_NC}" 
		echo $(cd ${pkg}; git status)
		echo
	fi
done

