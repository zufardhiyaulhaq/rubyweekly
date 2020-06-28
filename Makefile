REPOSITORY?=
TAG?=

build:
	CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' -o rubyweekly cmd/rubyweekly/*.go 
	docker build -t ${REPOSITORY}:${TAG} .
	rm rubyweekly

