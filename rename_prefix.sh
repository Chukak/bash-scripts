OLD_PREFIX=""
NEW_PREFIX=""
RECURSIVE=0

usage() {
    echo ""   
}

read_arguments() {
    for (( i = 1; i<=$#; i++)); do
        arg="${!i}"
        case $arg in
            -recursive)
                RECURSIVE=1
                ;;
            -add)
                OLD_PREFIX="^"
                ((++i))
                NEW_PREFIX="${!i}"
                ;;
            *)
                OLD_PREFIX=$arg
                if (( ((++i)) <= $# )); then
                    NEW_PREFIX="${!i}"
                    ((i++))
                fi
                ;;
        esac
    done
}

rename_file() {
    rename -verbose "s/$OLD_PREFIX/$NEW_PREFIX/" $1
}

if [[ $# -ge 1 ]]; then
    # read read arguments
    read_arguments "$@"
    name=$([[ $OLD_PREFIX == "^" ]] && echo "*" || echo "$OLD_PREFIX*")
    # change filename
    while read dir
    do
        cd $dir >> /dev/null
        while read file
        do
            if [[ $file == "$(basename $0)" ]]; then
                continue
            fi
            rename_file $file
        done < <(find ./ -maxdepth 1 -type f -name "$name" -printf "%f\n")
        cd - >> /dev/null
        if [[ $RECURSIVE -eq 0 ]]; then 
            break 
        fi
    done < <(find $PWD -type d)
else
    echo "ERROR"
fi

unset NEW_PREFIX
unset DEPTH_FLAG
unset OLD_PREFIX
