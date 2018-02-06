#! /bin/bash
#
# get /etc/passwd info as
# -----------
# Username: x
# ID: x
# Group ID: x
# Home: x
# Shell:x
# -----------
# Count: y


# check arguments 	 
if (( $#==0 )); then
	# awk script
	awk 'BEGIN  {
print "Start..."; FS=":"; count=0 }
{ print "\n--------------------------------------------\n";
printf "Username: %s \nID: %s\nGroup ID: %s\nInfo: %s\nHome directory: %s\nCommand/shell: %s\n", $1,$3,$4,$5,$6,$7; 
count++ } 
END {
printf "\nCount: %d\nEnd...\n", count }' /etc/passwd
else
	# error if $# > 0
	echo 'This script can`t have options or arguments.'
fi

