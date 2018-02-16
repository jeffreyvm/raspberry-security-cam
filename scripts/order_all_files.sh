#!/usr/bin/env bash


cd /media/webcam/motion

#list all dates and hours
for folder in $( ls -p | sed "s/[0-9][0-9][0-9][0-9]-.*//" | sort | uniq | grep -v / | tr _ / );
do
    foldername=$folder\_00

    if [ ! -d $foldername ]; then
        mkdir $foldername -p
        echo created folder $foldername
    fi

done;