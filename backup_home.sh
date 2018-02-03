#! /bin/bash
# backup home dir script, to .tar.gz 
# add script in your .bashrc as alias or run
#  

# check if root
if (( $EUID!=0 )); then
	# if not
	# get path home for user 
	path=$(eval echo ~$USER)
	# check arguments
	# if not special backup dir 
	if (( $#==0 )); then
		# set your path for backup	
		user_path=/home/$USER/_backup_home
		# create folder if not exists	
		if [[ ! -d $user_path ]]; then
			mkdir $user_path
			echo "Create folder $user_path"
		fi
 		# archive backup
		# exclude hidden files and dirs and _backup_home and other _* dirs
		tar -cvzf $user_path/$USER.home.tar.gz $path --exclude="$path/.*" --exclude="$path/_*"
	# if set special backup dir	
	elif (( $#==1 )); then
		if [[ -d $1 ]]; then
			tar -cvzf $1/$USER.tar.gz $path --exclude="$path/.*$" --exclude="$path/_*"
		else
			echo "Directory $1 not found"
			# exit from script
			exit 128
		fi
	else
		echo "Run this command with path/to/backup or none.Example: backup_home [path/to/backup]."
		exit 128
	fi
# if user is root			
else
	# check arguments
	if (( $#==0 )) || (( $#>2)); then
		echo "You login as root. Get user in otion."
		echo "backup_home username [path/to/backup]"
		exit 128
	else
		# check if user name is exists
		user_id=$(id -u $1) 2> /dev/null
		# set previous commabd code
		complete=$?
		# if all ok
		# if two arguments, user and dir
		if (( $complete==0 )) && (( $#==2 )); then
			# get and check path
			path=$(eval echo ~$1)
			if [[ -d $2 ]]; then
				tar -cvzf $2/$1.tar.gz $path --exclude="$path/.*$" --exclude="$path/_*"
			else
				echo "Directory $2 not found."
				exit 128
			fi
		# if one argument, user
		elif (( $complete==0 )) && (( $#==1 )); then
			path=$(eval echo ~$1)
			tar -cvzf /home/_backup/$USER.home.tar.gz $path --exclude="$path/.*$" --exclude="$path/_*"
		else
			echo "User $1 not found."	
			exit 128
		fi
	fi	
fi	


