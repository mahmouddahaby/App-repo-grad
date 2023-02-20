FROM node:alpine as build

WORKDIR /hello-world

ENV PATH="./node_modules/.bin:$PATH"

COPY . .

RUN npm run build


FROM nginx:alpine

COPY  --from=build /hello-world/build /usr/share/nginx/html



