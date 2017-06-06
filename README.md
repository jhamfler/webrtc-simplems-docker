# webrtc-simplems-docker
A Docker image for a simple messaging server for webrtc.

* to setup the image run `setup.sh`
* to start a container of the image run `restart.sh`
* to use real certificates rename them like the ones in *path/to/webrtc-simplems-docker*/webrtc-simplems/data/certs/ and either
  * open restart.sh and edit the path for the DATA variable
  * or copy your certificates to *path/to/webrtc-simplems-docker*/webrtc-simplems/data/certs/

* the server will listen on 0.0.0.0:1337
