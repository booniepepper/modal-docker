arch := $(shell uname -m)
tag = booniepepper/modal:latest

.PHONY: build
build:
	docker buildx build . -t=$(tag) >build.log

.PHONY: test
test: build
	docker run $(tag) eval "$(shell cat hello.modal)"

.PHONY: release
release: build test
	docker push $(tag)
