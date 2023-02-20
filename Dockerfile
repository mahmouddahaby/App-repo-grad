FROM node:alpine as build

WORKDIR /hello-world

COPY . .

RUN npm i 

RUN npm run build


FROM nginx:alpine

COPY  --from=build /hello-world/build /usr/share/nginx/html



