all: check-gofmt vet build

build: 
	@CGO_ENABLED=0 GOOS=linux go build -a -tags netgo -ldflags '-w' -o main .

check-gofmt:
	@if [ -n "$(shell gofmt -l .)" ]; then \
		echo 1>&2 'The following files need to be formatted:'; \
		gofmt -l .; \
		exit 1; \
	fi

vet:
	@go vet ./...

lint:
	@golint ./...

test:
	@go test ./...
