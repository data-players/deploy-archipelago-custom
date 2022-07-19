FROM node:14.16-alpine

WORKDIR /app

RUN node -v
RUN npm -v

RUN apk add --update --no-cache autoconf bash libtool automake python alpine-sdk openssh-keygen yarn nano

RUN yarn global add serve

RUN yarn install

CMD yarn build && serve -s build -l 4000
