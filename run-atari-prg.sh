#!/bin/bash

if [[ $# != 2 ]]; then
    echo "Usage: $0 PATH PREFIX"
    echo "where PATH is the directory to explore and PREFIX is the prefix of the files to open"
    exit 1
fi

for f in "$1"/"$2"*.zip; do
    f_base="$(basename "$f")"
    echo "Do you want to run ${f_base} [Y/n/q]?"
    read answer
    if [[ -z $answer || $answer == "Y" || $answer == "y" ]]; then
        hatari "$f"
    elif [[ $answer == "q" || $answer == "Q" ]]; then
        echo "Bye!"
        exit 0
    fi
done
