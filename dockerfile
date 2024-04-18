FROM node:17-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

CMD ["npm", "run", "dev", "--host 0.0.0.0" ]

FROM nginx:1.19.0
WORKDIR /usr/share/nginx/html
COPY . .
ENTRYPOINT ["nginx", "-g", "daemon off;"]
