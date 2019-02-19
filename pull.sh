#!/bin/bash


usage() {
    echo "Usage: ./pull.sh path [options]
    Options:
        --help          Show this information.
        -exclude        Excluded directories.
    Example:
        ./pull.sh ../submodules --exclude catch"
}

OPTIND=1
declare -a EXCLUDES_DIRS=()
optspec=":e-:"

if [[ $# -gt 0 ]]; then
    DIR_PATH=$1
    shift 
    while getopts "$optspec" opt; do
        case "${opt}" in
            -)
                case "${OPTARG}" in
                    exclude)
                        shift
                        for di in "${@}"; do
                            EXCLUDES_DIRS+=($di)
                        done
                        shift
                        ;;
                    *)
                        ;;
                esac
                ;;
            e)
                for di in "${@}"; do
                    EXCLUDES_DIRS+=($di)
                done
                shift
                ;;
            --help)
                usage
                exit 0
                ;;
            *)
                ;;
        esac
    done
    
    for d in $(find $DIR_PATH -mindepth 1 -maxdepth 1 -type d); do
        exclude=false
        for ch in "${EXCLUDES_DIRS[@]}"; do
            if [[ $(basename $d) == ${ch} ]]; then
                exclude=true
                break
            fi
        done
        if [[ $exclude == false ]]; then
            cd $d
            git pull origin master
            cd -
        fi
    done
else 
    usage
    exit 128
fi
