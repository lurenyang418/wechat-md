FROM node:17-alpine as front-builder

ENV SERVER_ENV=NETLIFY
ENV NODE_OPTIONS=--openssl-legacy-provider

RUN set -eux \
    && apk add git \
    && git clone --depth=1 https://github.com/doocs/md.git  \
    && cd md \
    && npm i \
    && npm run build:h5-netlify

FROM golang:alpine as bin-builder

WORKDIR /app

COPY . /app

COPY --from=front-builder /md/dist /app/assets

RUN CGO_ENABLED=0 go build -a --trimpath --ldflags="-s -w" -o md .

FROM alpine

COPY --from=bin-builder /app/md /usr/local/bin/md

EXPOSE 80

CMD ["md"]