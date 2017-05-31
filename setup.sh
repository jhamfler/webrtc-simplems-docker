#!/bin/bash

image="webrtc-simplems"

which git

if (( $? == 1))
then
	echo "git is not installed"
	exit 1
fi

git clone https://github.com/fmalcher/simple-websocket-server.git

docker build -t $image .
