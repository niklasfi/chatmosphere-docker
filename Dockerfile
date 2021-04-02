FROM docker.io/library/node:current-buster as build

ENV DEBIAN_FRONTEND="noninteractive"

# install preprequisites
RUN apt-get update && \
    apt-get install -y curl git nodejs npm && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/trilader/chatmosphere-app.git /usr/local/share/chatmosphere
WORKDIR /usr/local/share/chatmosphere

RUN npm install

COPY serverConfig.ts /usr/local/share/chatmosphere/src/serverConfig.ts

RUN npm run build

FROM docker.io/library/nginx:latest as run

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build /usr/local/share/chatmosphere/build /usr/share/nginx/html
COPY --from=build /usr/local/share/chatmosphere/screenshare /usr/share/nginx/html/screenshare
COPY favicon.ico /usr/share/nginx/html/favicon.ico
COPY example.js /usr/share/nginx/html/screenshare/example.js
