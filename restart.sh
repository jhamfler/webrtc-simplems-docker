#!/bin/bash

IMAGE="webrtc-simplems"
CONTAINER="$IMAGE"

# edit this path to point to real certificates
# right now it copies the unsigned provided ones
# you could for example put your certificates in <path to webrtc-simplems-docker>/data/certs/ and change the line to
# DATA=`dirname $(readlink -f "$0")`"/data"
DATA=`dirname $(readlink -f "$0")`"/$IMAGE/data"


printover () {
  printf "\r"
  for i in $(seq 1 $1)
  do
    printf " "
  done
  printf "\r"
}

# stop already running container
if docker ps | grep -q "$CONTAINER"
then
  echo '[WARNING] container already started'
  stopping='[..] '"stopping the container $CONTAINER ..."
  size=${#stopping}
  echo $stopping
  ./stop.sh 2>&1>/dev/null
  printover $size
  echo '[OK] '"$CONTAINER has been stopped"
fi

#remove old container
docker rm "$CONTAINER" 2>&1>/dev/null && echo '[OK] '"$CONTAINER"' container removed from previous run'

# start
docker run --name="$CONTAINER" -d -p 1337:1337 -v "$DATA":/data "$IMAGE" 1>/dev/null
if docker ps | grep -q "$CONTAINER"
then
  echo '[OK] '"starting $CONTAINER"
else
  echo '[FAILED] '"starting $CONTAINER"
  exit 3
fi

# print small docker ps for an overview
sleep 1
echo ""
oldifs="$IFS"
IFS=$'\n'
row1=( $(docker ps --format "table {{.Image}}\t{{.CreatedAt}}\t{{.Status}}") )
row2=( $(docker ps | awk '{print $NF}') )
r1len=${#row1[@]}
r2len=${#row2[@]}
for (( i=0; i<$r1len; i++ ));
do
  for (( j=0; j<$r2len; j++ ));
  do
    if [ $j == $i ]
    then
      if [ $i == 0 ]
      then
        echo -e "${row1[i]}\t\t ${row2[j]}"
      else
        echo -e "${row1[i]}\t ${row2[j]}"
      fi
    fi
  done
done
IFS="$oldifs"
echo ""
