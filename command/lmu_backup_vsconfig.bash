#!/bin/bash


backup_start() {
# Early return if there is no config to backup
if [ ! -d "${MIRENA_WS_DIR}/.vscode" ]; then
	echo -e "${LMU_RED}[ERROR]${LMU_NC} No config to backup"; 
	exit 1;
fi

# Backup the vscode enviroment
[ -d "${LMU_DIR}/backup/vsconfig" ] && rm -fr "${LMU_DIR}/backup/vsconfig"
cp -r "${MIRENA_WS_DIR}/.vscode" "${LMU_DIR}/backup/vsconfig"
}

backup_restore(){
# Early return if there is no backup to restore
if [ ! -d "${LMU_DIR}/backup/vsconfig" ]; then
	echo -e "${LMU_RED}[ERROR]${LMU_NC} No backup to restore"; 
	exit 1;
fi

# Restore the vscode enviroment
[ -d "${MIRENA_WS_DIR}/.vscode" ] && rm -fr "${MIRENA_WS_DIR}/.vscode"
cp -r "${LMU_DIR}/backup/vsconfig" "${MIRENA_WS_DIR}/.vscode"
}


###########################
## SCRIPT
###########################

# Make the backup directory if doesnt exist
[ -d "${LMU_DIR}/backup" ] || mkdir "${LMU_DIR}/backup" 

# Parse arguments
if [[ $# -ne 1 ]]; then
	echo -e "${LMU_RED}[ERROR]${LMU_NC} Not enough arguments"
	echo "Usage: $0 {start|restore}"
	exit 1
fi

case "$1" in
    start)
        echo "[Info] Starting backup..."
	backup_start
	echo "[Info] Done"
        ;;
    restore)
        echo "[Info] Restoring backup..."
	backup_restore
	echo "[Info] Done"
        ;;
    *)
        echo -e "${LMU_RED}[ERROR]${LMU_NC} Invalid option: $1"
        echo "Usage: $0 {start|restore}"
        exit 1
        ;;
esac

