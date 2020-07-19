FROM alpine:3.12

LABEL maintainer="protoc@k.kxd.dev"
LABEL org.label-schema.name="protoc"
LABEL org.label-schema.description="An image used to generate protobuf code for various languages"
LABEL org.label-schema.vcs-url="https://www.github.com/aphistic/protoc"

WORKDIR /src

RUN apk add --no-cache \
    git protoc \
    go \
    elixir \
    rust cargo

# Install go protobuf tools
RUN go get github.com/gogo/protobuf/protoc-gen-gofast

# Install elixir protobuf tools
RUN mix local.hex --force && \
    mix escript.install hex protobuf

# Install rust protobuf tools
RUN cargo install protobuf-codegen && \
    cargo install grpcio-compiler

ENTRYPOINT ["protoc"]