#!/bin/bash

# pid register time file
PID_REG_FILE="${LMU_TEMP_DIR}/ros2_megalaunch_pid_reg"

# Shut down the enviroment
while IFS= read -r PID; do
	# Check if the process exists
	if ps -p "$PID" > /dev/null; then
		# Kill the process
		echo "Killing process [${PID}]"
		kill "$PID"
	else
		echo "Process [$PID] does not exist."
	fi
done < "$PID_REG_FILE"

# Clear the file
: > $PID_REG_FILE

