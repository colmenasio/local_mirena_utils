#!/bin/bash

# Default values
flag_rqt=1
flag_rviz=1
flag_lidar=1

# Parse flags:
while [ $# -gt 0 ]
do
	case $1 in
		-r)
			flag_rqt=$(( ! $flag_rqt ))
			;;
		-v)
			flag_rviz=$(( ! $flag_rviz ))
			;;
		--lidar)
			flag_lidar=$(( ! $flag_lidar ))
			;;

	esac
	shift
done 


trap "kill \$(pgrep -P $$)" EXIT

ros2 run mirena_sim MirenaSim &
ros2 run mirena_utilities remo_con &
[ $flag_rqt ] && rqt &
[ $flag_rviz ] && rviz2 &
[ $flag_lidar ] && ros2 run mirena_lidar mirena_lidar &

wait


