FROM node:17-alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

CMD ["npm", "start", "dev"]


FROM nginx:latest
WORKDIR /use/share/nginx/html
RUN rm -rf ./*
COPY --from=builder . .
ENTRYPOINT ["nginx", "-g", "deamon off" ]
