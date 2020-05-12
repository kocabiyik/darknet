![Darknet Logo](http://pjreddie.com/media/files/darknet-black-small.png)

# Darknet #
Darknet is an open source neural network framework written in C and CUDA. It is fast, easy to install, and supports CPU and GPU computation.

Yolo v4 paper: https://arxiv.org/abs/2004.10934

Yolo v4 source code: https://github.com/AlexeyAB/darknet

For more information see the [Darknet project website](http://pjreddie.com/darknet).

For questions or issues please use the [Google Group](https://groups.google.com/forum/#!forum/darknet).

# Processing Video Frames

## 1. Extract Frames from Video

    bash extract-video-frames.sh video/my-video.mov

This extracts video frames to video/frames_my-video directory.

## 2. Apply YOLO for each frame

    bash apply-yolo-to-frames.sh video/frames_my-video

This command processes each frame and moves processed files to `frames_my-video_processed` directory.

## 3. Recreate the video with ffmpeg

ffmpeg  -framerate 29 -i video/frames_my-video_processed/plot_%04d.jpg -s:v 1920x1080 -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p -r 30 my-new-video.mp4
