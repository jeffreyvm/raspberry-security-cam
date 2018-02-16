#!/usr/bin/env bash
# This script orders the motion files in an folder per hour
# it orders all files that are captured in the current hour and the previous hour

function moveFiles(){

    DATE="$1"
    HOUR="$2"

    dir_name=

    echo start moving pictures made at $DATE $HOUR

    # first check if the date folder exists
    if ! [-d "$DATE\/$HOUR"]; then
        dir_name=$DATE\/$HOUR\_\0\0
        mkdir dir_name -p
    fi

    for curr_file in $(ls $DATE\_$HOUR* | sort -u);
    do
        echo move $curr_file to $dir_name
        mv curr_file dir_name
    done;

    echo end of script
}


curr_date=$(date +%Y%m%d)
curr_hour=$(date +%H)

cd /media/webcam/motion

moveFiles $curr_date $curr_hour
moveFiles $curr_date $($curr_hour+1)