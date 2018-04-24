# get list installed packages
# Example: apt_get_list [file]
apt_get_list() {
	if (( $#==1 )); then 
		if [[ -f $1 ]]; then
			# ubuntu 14.04 and above
			echo "$(apt-cache search . | grep -o '^\S*' > $1)"
			# other versions
			# echo $(dpkg -l > $1)
		else 
			echo "File not found."
			return 1
		fi 
	elif (( $#==0 )); then
		# ubuntu 14.04 and above
		echo "$(apt-cache search . | grep -o '^\S*')"
		# other versions
		# echo $(dpkg -l)
	else
		echo "apt_get_list [file]"
	fi
}


# install list packages from file
apt_install_from_file() {
	# check file
	if (( $#==1 )) && [[ -f $1 ]]; then
		# read all name packages from file
		while IFS='' read -r var; do
			echo "Installing $var "
			# install package with -yes option
			echo "$(sudo apt-get install -y $var)"
		done < "$1"
	else
		echo "File not found."
	fi	
}
