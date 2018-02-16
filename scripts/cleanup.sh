#!/usr/bin/env bash

find /media/webcam/motion/ordered/* -type d -ctime +2 -exec rm -rf {} \;