FROM golang:1.12-alpine

MAINTAINER Erik Davidson <erik@erikd.org>

RUN apk add --no-cache protobuf git

RUN mkdir -p /src

RUN go get github.com/gogo/protobuf/protoc-gen-gofast

WORKDIR /src

ENTRYPOINT ["protoc"]