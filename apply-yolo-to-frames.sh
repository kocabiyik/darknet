#!/bin/bash
DIR=$1

# create a directory for the processed files
DIR_FOR_PROCESSED_FRAMES=$(echo ${DIR} | cut -d'/' -f 2)
DIR_FOR_PROCESSED_FRAMES=${DIR_FOR_PROCESSED_FRAMES}_processed
mkdir -p video/${DIR_FOR_PROCESSED_FRAMES}


for f in ${DIR}/*.jpg; do
    for ((i=0; i<1; i++)); do
        FILENAME=$(echo $f | cut -d'/' -f 3)
        echo 'Processing ${f}'
        ./darknet detector test cfg/coco.data cfg/yolov3.cfg yolov3.weights video/frames_venice-in-a-min/${FILENAME}
        mv predictions.jpg video/${DIR_FOR_PROCESSED_FRAMES}/${FILENAME}
        rm $f
        sleep 30s
    done
done
