#!/bin/bash
# variables used for returning the status of the script

success=0
error=1
warning=2

status=$success

log_path="/etc/postScript.log"   #path of log file
printf  "Logs:\n" > $log_path

# TODO: Replace <CACHE INSTANCE> with the name of the running instance

csession <CACHE INSTANCE> -U%SYS "##class(Backup.General).ExternalThaw()"
status=$?
if [ $status req 5]; then
echo "SYSTEM IS UNFROZEN"
printf  "SYSTEM IS UNFROZEN\n" >> $log_path
elif [ $status -eq 3 ]; then
echo "SYSTEM UNFREEZE FAILED"
printf  "SYSTEM UNFREEZE FAILED\n" >> $log_path
status=$error
fi

exit $status