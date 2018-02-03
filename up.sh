# #! /bin/bash
# this script better run as function
# add this script your .bashrc 
# up [level] in terminal 
#

# function 
up() {
	# if argument
	if (( $#==1 )); then
		# set level
		LIMIT=$1
		# path
		GOTO=''
		# current directory
		P=$PWD
		# set path for level
		# Example: 
		#	name@host: cd /path/to/dir/other/app
		# name@host:/path/to/dir/other/path/to/app# up 3
		# name@host:/path/to/dir/other# <-- 3 level up
		for ((i=0; i< $LIMIT; i++ )); do
			# Example: 4 level - ../../../../
			GOTO=$GOTO../
		done
		cd $GOTO
		echo "$P --> $PWD"
	else
		echo "up [level]"
		return 1
	fi
}
