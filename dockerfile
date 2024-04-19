FROM node:17-alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm build

CMD ["npm", "start", "dev"]


FROM nginx:latest
WORKDIR /use/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /app/build .
ENTRYPOINT ["nginx", "-g", "deamon off" ]
