# protoc

Example usage:
```
$ docker run --rm -it -u $(id -u):$(id -g) -v $PWD:/src:rw aphistic/protoc --gofast_out=. *.proto
```
