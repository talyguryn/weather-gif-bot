FROM node:22-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg tzdata && \
    rm -rf /var/lib/apt/lists/*

ENV TZ=Europe/Moscow

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN npm ci --quiet

COPY . .

CMD ["npm", "start"]
