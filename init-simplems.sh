#!/bin/bash

# copy all mounted data like certificates
if ls /data 2>/dev/null
then
	cp -r /data /usr/src/app/data
fi

cd /usr/src/app/
npm run startForever
