# BUILD PHASE
FROM node:alpine as builder

WORKDIR '/app'

RUN apk add yarn

COPY package.json .

RUN yarn

COPY . .

RUN yarn build

# RUN PHASE
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

