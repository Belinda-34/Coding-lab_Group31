#!/bin/bash
#This function creates knh directories 
initialize_system() {
	if [ ! -d "active_logs" ]; then
		echo "Creating active_logs directory.."
		mkdir active_logs
	else  
		echo "active_logs directory already exists"
	fi 
	
	if [ ! -d "archived_logs" ]; then
		echo "Creating archived_logs directory.."
		mkdir archived_logs
	else  
		echo "archived_logs directory already exists"

	fi 

	if [ ! -d "reports" ]; then 
		echo "Creating reports directory.."
		mkdir reports
	else 
		echo "reports directory already exists."
	fi
	
	echo "system directories initailized successfully"
}

# Author: brukundo-crypto (Member 2 - Security Lead)
# Purpose: Enforce owner-only access on the active_logs directory.
# This function secures the active_logs directory
# Only the owner should be able to read and write.
# active_logs is a directory, so the owner also needs execute (x) to enter it.
# 700 = owner rwx, group nothing, others nothing.
secure_data() {
    echo "Securing active_logs directory..."
    chmod 700 active_logs
    echo "Permissions updated. Current permissions:"
    ls -ld active_logs
    echo "active_logs is now secured (owner-only access)."
}

initialize_system
secure_data

echo "System Environment Secured - $(date)"
