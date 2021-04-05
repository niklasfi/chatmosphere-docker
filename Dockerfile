FROM docker.io/library/node:current-buster as build

ENV DEBIAN_FRONTEND="noninteractive"

# install preprequisites
RUN apt-get update && \
    apt-get install -y curl git nodejs npm && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/niklasfi/chatmosphere-app.git /usr/local/share/chatmosphere && \
    git -C /usr/local/share/chatmosphere checkout 9ceed3c240cd110657f4c39dcef306b44e011700
WORKDIR /usr/local/share/chatmosphere

RUN npm install

COPY serverConfig.ts /usr/local/share/chatmosphere/src/serverConfig.ts

RUN npm run build

FROM docker.io/library/nginx:latest as run

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build /usr/local/share/chatmosphere/build /usr/share/nginx/html
COPY favicon.ico /usr/share/nginx/html/favicon.ico
