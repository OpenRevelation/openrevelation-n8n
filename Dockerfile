FROM docker.n8n.io/n8nio/n8n:1.91.3
USER root
RUN apk add --no-cache ffmpeg curl imagemagick
RUN npm install -g n8n-nodes-webdav-client
RUN chown -R node:node /home/node/.n8n
USER node
