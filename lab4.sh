#!/bin/bash

if [ "$1" = "--date" ]; then
    date
fi

if [ "$1" = "--logs" ]; then

    if [ -z "$2" ]; then

        for ((i=1; i<=100; i++))
        do
            filename="log$i.txt"
            echo "File name: $filename" > "$filename"
            echo "Mother script name: lab4.sh" >> "$filename"
            echo "Date of file creation: $(date)" >> "$filename"
        done
    fi
fi

if [ "$1" = "--logs" ]; then

    if [ -z "$2" ]; then
        echo "If you want a specific number of file created, please add the number as an argument."
        exit 1
    fi

    num_files="$2"

    for ((i=1; i<=$num_files; i++))
    do
        filename="log$i.txt"
        echo "File name: $filename" > "$filename"
        echo "Mother script name: lab4.sh" >> "$filename"
        echo "Date of file creation: $(date)" >> "$filename"
    done
fi

