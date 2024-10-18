FROM node

WORKDIR /app

COPY package.json /app

RUN npm isntall

COPY . /app

EXPOSE 80

CMD [ "node", "app"]