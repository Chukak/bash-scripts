#! /bin/bash 
# bash files backup script
# default backup as directory ans files
# user can backup as .tar.gz

# set your default backup path
BACKUP_PATH=/home/_backup/bash
# set files, which must be backuped
FILES=(~/.bashrc ~/.bash_logout ~/.bash_history /etc/bash.bashrc /etc/profile)
# check arguments	
if (( $#>2 )); then
	echo 'backup_bash [option] [-tar] [path]. Options: -extra.'
	exit 128
fi
# check arguments and if dir exists
if (( $#==2 )) && [[ -d $2 ]]; then
	BACKUP_PATH=$2
fi
# if dir not exists, user can create 
if [[ ! -d $BACKUP_PATH ]]; then
	echo "$(sudo -S mkdir $BACKUP_PATH)"
# if exists, user can refresh or not.
else
	echo "$BACKUP_PATH exists. You refresh $BACKUP_PATH?"
	# read user answer
	read -p '(Y/N):' N
	# if user agree
	if [[ $N == "Y" || $N == "y" ]]; then
		# print old files from dir, exclude hidden 
		list=$(sudo -S ls -l -a $BACKUP_PATH | grep '\.[^\.]\{1,\}') 
		echo 'Old files'
		echo "$list"
	else
		echo "Exit"
		exit 128
	fi
fi
# copie all files to backup dir	
for file in ${FILES[@]}; do
	if [[ -f $file ]]; then
		filename="${file##*/}"
		$(sudo cp $file $BACKUP_PATH/$filename)
	else
		echo "$file not backup. $file not exists."
	unset file
	fi
done
# print new files
echo 'New files'
echo "$(sudo -S ls -l -a $BACKUP_PATH | grep '\.[^\.]\{1,\}')"
	
# set you scripts directory
# if you have special directory for script
# include here your directory
if [[ -d /etc/scripts ]]; then
	$(sudo  cp -r /etc/scripts $BACKUP_PATH/scripts)
fi
# if backup as .tar.gz	
if [[ $1 == '-tar' ]]; then
	$(sudo tar -cvzf $BACKUP_PATH/bash.tar.gz $BACKUP_PATH)
fi
# print result	
echo 'Result:'
echo "$(ls -l -a $BACKUP_PATH)"

