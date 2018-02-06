# bash-scripts
## Inroduction
Some bash simple scripts, backup scripts and other.
## Scripts
Backup bash files script. Reserves bash file and bash dir as dir or archive. You can add custom dir with scripts.

<strong>Options:</strong> `-tar`

<strong>Example:</strong> `. backup_bash.sh [-tar] /path/to/backup/dir`

[backup bash](https://github.com/Chukak/bash-scripts/blob/master/backup_bash.sh)
<hr>

Backup home directory. Reserves directory files and dirs, exclude hidden\starting with _ dirs and files.

<strong>Example root:</strong> `. backup_home.sh username [path/to/backup/dir]`

<strong>Example not root:</strong> `. backup_home.sh [path/to/backup/dir]`

[backup home](https://github.com/Chukak/bash-scripts/blob/master/backup_home.sh)
<hr>

Sizeword. Change uppercase letter to lowercase. Lowercase letters to uppercase. 

<strong>Option:</strong> `-l, -lower, -u, -upper`

<strong>Example:</strong> `replace_size_word 'aaabbb' [option]`

[sizeword](https://github.com/Chukak/bash-scripts/blob/master/sizeword.sh)
<hr>

Up. Move N level up from current directory.

<strong>Example:</strong> `up level` 

[up](https://github.com/Chukak/bash-scripts/blob/master/up.sh)
<hr>

Apt_setup. Two functions for apt. 

<strong>apt_get_list -</strong> function get list name of packages to file or STDOUT.

<strong>Example:</strong> `apt_get_list [file]`
  
<strong>apt_install_from_file -</strong> function install all packages from file. File can create previous function.

<strong>Example:</strong> `apt_install_from_list file`
  
[apt_setup](https://github.com/Chukak/bash-scripts/blob/master/apt_setup.sh) 
<hr>

Ip_setup. Two functions, get ip and get local ip.

<strong>get_ip -</strong> function get your public ip.

<strong>Example:</strong> `get_ip` 

<strong>get_local_ip -</strong> function get local ip, or all local ip.

<strong>Options:</strong> `-all`

<strong>Example:</strong> `get_local_ip [option]`

[ip_setup](https://github.com/Chukak/bash-scripts/blob/master/ip_setup.sh)
<hr>

User_info. Script get users info from /etc/passwd.

<strong>Example:</strong> `. user_info.sh`

[user info](https://github.com/Chukak/bash-scripts/blob/master/user_info.sh)

## Autors
[chukak](https://github.com/Chukak)
