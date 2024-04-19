FROM node:17-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000

RUN npm run start:buid

CMD ["npm", "start:server", "run", "dev"]
