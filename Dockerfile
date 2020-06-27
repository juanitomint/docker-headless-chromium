FROM node:erbium-alpine 
WORKDIR /usr/src/app
ENV CHROME_BIN=/usr/bin/chromium-browser
RUN apk add chromium --update