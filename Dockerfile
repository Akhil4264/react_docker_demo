FROM node:14-alpine as nodeserver

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx
COPY --from=nodeserver /app/build /usr/share/nginx/html
EXPOSE 80
