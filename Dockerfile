FROM node:erbium-alpine 
# CONSUME BUILD ARGS FOR TRACE
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE 
      
WORKDIR /usr/src/app
ENV CHROME_BIN=/usr/bin/chromium-browser
RUN apk add chromium --update