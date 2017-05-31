#!/bin/bash

image="webrtc-simplems"

which git

if (( $? == 1))
then
	echo "git is not installed"
	exit 1
fi

git clone https://github.com/fmalcher/webrtc-simplems.git

docker build -t $image .
