FROM node:12.16-alpine

WORKDIR /app

RUN node -v
RUN npm -v

RUN apk add --update --no-cache autoconf bash libtool automake python alpine-sdk openssh-keygen yarn nano

RUN yarn global add pm2

COPY . /app

RUN yarn install

CMD [ "pm2-runtime", "ecosystem.config.js" ]