#!/bin/bash

# Flags:
# -v Launch rviz2
# -r Launch rqt

# Empty the pid time file
PID_REG_FILE="${LMU_TEMP_DIR}/ros2_megalaunch_pid_reg"
: > $PID_REG_FILE

# Start the enviroment and save the enviroment pid
${LMU_DIR}/command/ros2_megalaunch.bash $@ &
echo $! >> $PID_REG_FILE

