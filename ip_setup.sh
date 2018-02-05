
# get public and local ip script
# get public ip
get_ip() {
	# apt-cache for ubuntu 14.04 and above 
	# check curl package and use him
	if [[ $(apt-cache policy curl | grep 'curl') ]]; then
		echo 'Use curl'
		echo "$(curl -s checkip.amazonaws.com)"
	# check dnsutils package and use dig from dnsutils
	elif [[ $(apt-cache policy dnsutils | grep 'dnsutils') ]]; then
		echo 'Use dig'
		echo "$(dig +short myip.opendns.com @resolver1.opendns.com)"
	# use wget
	else
		echo 'Use wget'
		echo "$(wget -qO- http://ipecho.net/plain)"
	fi
}

# get local ip
get_local_ip() {
	# if -all option
	if [[ $1=='-all' ]] && (( $#==1 )); then
		# check ip addresses
		if [[ $(hostname -I) ]]; then
			echo 'All ip addresses:'
			echo "$(hostname -I)"
		else
			echo "Ip addresses not found"
		fi
	# if not option
	elif (( $#==0 )); then
		# get local ip use google public dns 
		echo "$(ip route get 8.8.8.8 | awk '{print $NF; exit}')"
	else
		echo 'get_local_ip [option]. Options: -all.'
	fi 
}

