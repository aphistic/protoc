FROM alpine:3.12

LABEL maintainer="protoc@k.kxd.dev"
LABEL org.label-schema.name="protoc"
LABEL org.label-schema.description="An image used to generate protobuf code for various languages"
LABEL org.label-schema.vcs-url="https://www.github.com/aphistic/protoc"

WORKDIR /src

RUN apk add --no-cache \
    git protobuf-dev \
    go \
    elixir \
    rust cargo

# Install rust protobuf tools
RUN cargo install protobuf-codegen && \
    cargo install grpcio-compiler && \
    mv /root/.cargo/bin/protoc-gen-rust /usr/bin/ && \
    rm -rf /root/.cargo

# Install go protobuf tools
ENV GOPATH /go
RUN go get github.com/gogo/protobuf/protoc-gen-gofast && \
	go get github.com/gogo/protobuf/protoc-gen-gogofast && \
    go get github.com/gogo/protobuf/protoc-gen-gogofaster && \
    go get github.com/gogo/protobuf/protoc-gen-gogoslick && \
    mv /go/bin/protoc-gen-gofast /usr/bin/ && \
    mv /go/bin/protoc-gen-gogofast /usr/bin/ && \
    mv /go/bin/protoc-gen-gogofaster /usr/bin/ && \
    mv /go/bin/protoc-gen-gogoslick /usr/bin/

# Install elixir protobuf tools
# This env just gets rid of a warning message in the build
ENV PATH $PATH:/root/.mix/escripts
# protobuf 0.8.0 is required for Protobuf.Extension support
RUN mix local.hex --force && \
    mix escript.install --force hex protobuf 0.8.0-beta.1 && \
    mv /root/.mix/escripts/protoc-gen-elixir /usr/bin/


ENTRYPOINT ["protoc"]
