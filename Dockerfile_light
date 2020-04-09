FROM node:10-stretch

ENV NODE_ENV="production"
ENV CHOKIDAR_USEPOLLING=1
ENV CHOKIDAR_INTERVAL=500
EXPOSE 80
VOLUME /data
WORKDIR /data
ENTRYPOINT ["node", "/usr/src/app/", "-p", "80"]

RUN mkdir -p /usr/src/app
COPY / /usr/src/app
RUN cd /usr/src/app && npm install --production
