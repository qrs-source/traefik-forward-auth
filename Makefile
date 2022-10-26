.PHONY: format test

CGO_ENABLED=0
OOS=linux
GOARCH=amd64

format:
	gofmt -w -s internal/*.go internal/provider/*.go cmd/*.go

test:
	go test -v ./...

build:
	CGO_ENABLED=0 OOS=linux GOARCH=amd64 go build -o traefik-forward-auth ./cmd

docker: build
	docker build -f Dockerfile --tag sourceops.azurecr.io/traefik-forward-auth:latest . --build-arg CERT=./source.crt


