# #! /bin/bash
# this script better run as function

# replace char upper to lower and lower to upper
replace_size_word() {
	# option
	option=$2
	file=$1
	# set defaut parameter fo file or string
	F=cat
	# check args
	if (( $#!=2 )); then
		echo 'replace_size_word [file or string] [-lower or -upper]' 
		return 1
	fi
	# if file or string exists
	if [[ -e $file ]] || [[ $file ]] ; then
		# set echo command for string
		if [[ ! -e $file ]]; then
			F=echo
		fi
		# if upper
		if [[ $option == '-upper' ]] || [[ $option == '-u' ]]; then
			echo $($F $file | sed 's/[[:lower:]]/\U&/g')
		# if lower
		elif [[ $option == '-lower' ]] || [[ $option == '-l' ]]; then
			echo $($F $file | sed 's/[[:upper:]]/\L&/g') 
		# if invalid option
		else
			echo 'Invalid option. Only -lower of -upper.'
			return 1 
		fi
	else 
		printf 'replace_size_word [file or string] [option]'
		return 1
	fi
}

# Example:
# replace_size_word 'aaabbbccc' -u --> 'AAABBBCCC'
# replace_size_word 'AaAbBBCCC' -l --> 'aaabbbccc'
