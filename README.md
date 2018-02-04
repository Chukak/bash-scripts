# bash-scripts
## Inroduction
Some bash simple scripts, backup scripts and other.
## Scripts
Backup bash files script. Reserves bash file and bash dir as dir or archive. You can add custom dir with scripts.

<strong>Options:</strong> `-tar`

<strong>Example:</strong> `backup_bash [-tar] /path/to/backup/dir`

[backup bash](https://github.com/Chukak/bash-scripts/blob/master/backup_bash.sh)
<hr>

Backup home directory. Reserves directory files and dirs, exclude hidden\starting with _ dirs and files.

<strong>Example root:</strong> `sudo backup_home username [path/to/backup/dir]`

<strong>Example not root:</strong> `backup_nome [path/to/backup/dir]`

[backup home](https://github.com/Chukak/bash-scripts/blob/master/backup_home.sh)
<hr>

Sizeword. Change uppercase letter to lowercase. Lowercase letters to uppercase. 

<strong>Option:</strong> `-l, -lower, -u, -upper`

<strong>Example:</strong> `replace_size_word 'aaabbb' [option]`

[sizeword](https://github.com/Chukak/bash-scripts/blob/master/sizeword.sh)
<hr>

Up. Move N level up from current directory.

<strong>Example:</strong> up level 

[up](https://github.com/Chukak/bash-scripts/blob/master/up.sh)
<hr>

Apt_setup. Two functions for apt. 

<strong>apt_get_list -</strong> function get list name of packages to file or STDIN.

<strong>Example:</strong> apt_get_list [file]
  
<strong>apt_install_from_file -</strong> function install all packages from file. File can create previous function.

<strong>Example:</strong> apt_install_from_list file
  
[apt_setup](https://github.com/Chukak/bash-scripts/blob/master/apt_setup.sh) 

## Autors
[chukak](https://github.com/Chukak)
