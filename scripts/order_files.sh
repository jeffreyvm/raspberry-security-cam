#!/usr/bin/env bash
# This script orders the motion files in an folder per hour
# it orders all files that are captured in the current hour and the previous hour

function moveFiles(){

    DATE="$1"
    HOUR="$2"


    dir_name=$DATE\/$HOUR\_\0\0
    echo start moving pictures made at $dir_name

    # first check if the date folder exists
    if [ ! -d $dir_name]; then
        mkdir $dir_name -p
        echo created folder $dir_name
    fi

    for curr_file in $(ls $DATE\_$HOUR* | sort -u);
    do
        echo move $curr_file to $dir_name
        mv $curr_file $dir_name
    done;

    echo end of script
}


curr_date=$(date +%Y%m%d)
curr_hour=$(date +%H)
prev_hour=$(date +%H -d "1 hour ago")

cd /media/webcam/motion

moveFiles $curr_date $curr_hour
moveFiles $curr_date $prev_hour