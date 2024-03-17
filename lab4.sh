#!/bin/bash

if [ "$1" = "--date" ]; then
    if [ "$2" = "-d" ]; then
        date
	fi
fi

if [ "$1" = "--logs" ]; then

    if [ "$2" = "-l" ]; then

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

    if [ "$2" = "-l" ]; then
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

if [ "$1" = "--help" ]; then
    if [ "$2" = "-h" ]; then
        echo "Usage: lab4.sh [option]"
        echo "Options:"
        echo "  --date		            Display current date"
        echo "  --logs		            Create 100 numbered log files"
        echo "  --logs <number_of_files>    Create specified number of log files"
        echo "  --help	                    Display this help message"
    fi
fi

