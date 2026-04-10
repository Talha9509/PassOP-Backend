FROM node:24-alpine
# apline is lighter version of node for every version

WORKDIR /app

COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json

RUN npm install

COPY . .

# when npm install is below the copy . ., then on any change in server.js, the copy . . chaanges, then npm i needs to start again(not from cached) so we need to optimize it
# RUN npm install

# i have not done for database
# for database, as it is a secret, so you pass it with -e
# for localDB,
# ENV MONGODB_URI=mongodb://localhost:27017


EXPOSE 3000

CMD [ "node","server.js" ]
# docker build -t name
