FROM nodesource/node:6.3.0

# 1st adding dependencies (this way you don't rebuild your modules each time you re-build your container)

ADD simple-websocket-server/package.json .
ADD simple-websocket-server/server.js .
 
RUN npm install

#ADD . .

EXPOSE 1337
CMD ["npm", "run", "startForever"]
