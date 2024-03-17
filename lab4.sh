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
        echo "  --date -d	            Display current date"
        echo "  --logs -l	            Create 100 numbered log files"
        echo "  --logs <number_of_files>    Create specified number of log files"
        echo "  --help -h                   Display this help message"
        echo "  --init	                    Clone repository to directory 'repository'"
        echo "  --error	                    Create 100 numbered error directories with numbered error files"
        echo "  -e               	    Create 100 numbered error directories with numbered error files"
        echo "  --error <number_of_files>   Create specified number of log files"
        echo "  -e <number_of_files>   	    Create specified number of log files"
    fi
fi

if [ "$1" = "--init" ]; then

    script_path=$(realpath "$0")
    work_dir=$(pwd)
    clone_dir="$work_dir/repository"
    
    git clone https://github.com/KamilStasiewicz00/Narzedziapracy-Lab4.git "$clone_dir"
    
    echo "export PATH=\"$clone_dir:\$PATH\"" >> ~/.bashrc
    source ~/.bashrc  # Zastosuj zmiany bez potrzeby wylogowywania się i ponownego logowania
fi

if [ "$1" = "--error" ] || [ "$1" = "-e" ]; then
    if [ -z "$2" ]; then
        num_files=100
    else
        num_files="$2"
    fi

    for ((i=1; i<=$num_files; i++))
    do
        error_dir="error$i"
        mkdir -p "$error_dir"
        echo "Error file" > "$error_dir/error$i.txt"
    done
fi