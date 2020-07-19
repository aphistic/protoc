# protoc

This image can be used to generate protobuf and grpc code for various languages.

## Usages

### Go

```bash
$ docker run --rm -it -u $(id -u):$(id -g) -v $PWD:/src:rw aphistic/protoc --gofast_out=. *.proto
```

### Elixir

```bash
$ docker run --rm -it -u $(id -u):$(id -g) -v $PWD:/src:rw aphistic/protoc --elixir_out=plugins=grpc:. *.proto
```