FROM golang:1.18-alpine as builder

ARG CERT

RUN apk add --no-cache \
  git \
  curl \
  ca-certificates

WORKDIR /app

COPY traefik-forward-auth /app/
COPY $CERT /usr/local/share/ca-certificates/
RUN update-ca-certificates

CMD [ "./traefik-forward-auth" ]
