#!/bin/bash

if [ "$1" = "--date" ]; then
    date
fi

if [ "$1" = "--logs" ]; then
    for ((i=1; i<=100; i++))
    do
        filename="log$i.txt"
        echo "File name: $filename" > "$filename"
        echo "Mother script name: lab4.sh" >> "$filename"
        echo "Date of file creation: $(date)" >> "$filename"
    done
fi

