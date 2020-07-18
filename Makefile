.PHONY: api

PROTO_BUILD_DIR = ../../..
PROTO_TARGET = ./pkg/api/shared


help:
	@echo "Service building targets"
	@echo "  api: compile protobuf files for go"

api:
	git pull --recurse-submodules
	find "$(PROTO_TARGET)" -type f -delete
	find ./api/service_proto/common/*.proto -maxdepth 1 -type f -exec protoc {} --go_out=plugins=grpc:$(PROTO_BUILD_DIR) \;

