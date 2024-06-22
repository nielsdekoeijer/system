# Makefile

# Define variables
IMAGE_NAME=system_void_build

# Default target
.PHONY: test

test:
	@echo "Building Docker image..."
	docker build -t $(IMAGE_NAME) .
	@echo "Running Docker container..."
	docker run -v $(PWD)/../../:/workspace $(IMAGE_NAME) make
