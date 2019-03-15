# bash-scripts
## Inroduction
Some bash simple scripts, backup scripts and other.

## Scripts
The backup script for bash files. Copies bash files and bash dir to the backup directory or archive. You need to add a backup directory.

<strong>Options:</strong> `-tar`

<strong>Example:</strong> `./backup_bash.sh [-tar] /path/to/backup/dir`

[backup bash](https://github.com/Chukak/bash-scripts/blob/master/backup_bash.sh)
<hr>

The backup script for a home directory. Copies a home directory, exclude dirs and files, that starting with `_`.

<strong>Example root:</strong> `. backup_home.sh username [path/to/backup/dir]`

<strong>Example not root:</strong> `. backup_home.sh [path/to/backup/dir]`

[backup home](https://github.com/Chukak/bash-scripts/blob/master/backup_home.sh)
<hr>

The script to changing the size of words. 

<strong>Option:</strong> `-l, -lower, -u, -upper`

<strong>Example:</strong> `replace_size_word 'aaabbb' [option]`

[sizeword](https://github.com/Chukak/bash-scripts/blob/master/sizeword.sh)
<hr>

The script returns you to some level back. 

<strong>Example:</strong> `up level` 
```
user@user:~/dir1/dir2/dir3/dir4$ up 3
user@user:~/dir1$
```

[up](https://github.com/Chukak/bash-scripts/blob/master/up.sh)
<hr>

The `apt_get_list` function returns a list of all installed packages.
The `apt_install_from_list` function sets all packages from the list.

<strong>Example:</strong> `apt_get_list [file]`
  
<<strong>Example:</strong> `apt_install_from_list file`
  
[apt_setup](https://github.com/Chukak/bash-scripts/blob/master/apt_setup.sh) 
<hr>

The `get_ip` function returns your public ip.
The `get_local_ip` function returns your local ip.

<strong>Example:</strong> `get_ip` 

<strong>get_local_ip -</strong> function returns your local ip, or all your local ip.

<strong>Options:</strong> `-all`

<strong>Example:</strong> `get_local_ip [option]`

[ip_setup](https://github.com/Chukak/bash-scripts/blob/master/ip_setup.sh)
<hr>

The script returns information about users from /etc/passwd.

<strong>Example:</strong> `./user_info.sh`

[user info](https://github.com/Chukak/bash-scripts/blob/master/user_info.sh)

Update master branch from git submodules.

<strong>Examples:</strong> 
  * `./pull.sh ./submodules --exclude catch2 googletest`
  * `./pull.sh ./submodules`

[pull](https://github.com/Chukak/bash-scripts/blob/master/pull.sh)
