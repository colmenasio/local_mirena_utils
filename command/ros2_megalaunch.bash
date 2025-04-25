#!/bin/bash

# Flags:
# -v Launch rviz2
# -r Launch rqt

# Parse flags:
while [ $# -gt 0 ]
do
	case $1 in
		-r)
			flag_rqt=1
			;;
		-v)
			flag_rviz=1
			;;
	esac
	shift
done 

ros2 run mirena_sim MirenaSim &
ros2 run mirena_utilities remo_con &
[ $flag_rqt ] && rqt &
[ $flag_rviz ] && rviz2 &




