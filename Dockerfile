FROM nodesource/node:6.3.0

# 1st adding dependencies (this way you don't rebuild your modules each time you re-build your container)

ADD webrtc-simplems/package.json .

RUN npm install

ADD webrtc-simplems/ .

EXPOSE 1337
CMD ["npm", "run", "startForever"]
