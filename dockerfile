FROM node

WORKDIR '/app'

COPY package.json .

RUN yarn

COPY . .

EXPOSE 3333

CMD ["node", "./src/app.js"]