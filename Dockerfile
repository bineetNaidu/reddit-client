FROM node:14.14.0-alpine

WORKDIR /usr/reddit-client
ADD package*.json ./

RUN npm ci
ADD ./ ./

EXPOSE 3000/tcp
CMD [ "npm", "run", "dev" ]