DOCKER_IMAGE_NAME=savantboost_builder

build-dgpu-builder:
	docker buildx build \
		-t ${DOCKER_IMAGE_NAME}_dgpu \
		-f docker/Dockerfile.dgpu \
		--progress=plain \
		--platform linux/amd64 \
		.

build-xavier-builder:
	docker buildx build \
		-t ${DOCKER_IMAGE_NAME}_xavier \
		-f docker/Dockerfile.jetson-xavier \
		--progress=plain \
		--platform linux/arm64 \
		.

build-nano-builder:
	docker buildx build \
		-t ${DOCKER_IMAGE_NAME}_nano \
		-f docker/Dockerfile.jetson-nano \
		--progress=plain \
		--platform linux/arm64 \
		.

build-dgpu-lib:
	docker run --rm -v `pwd`/dist:/opt/app/dist ${DOCKER_IMAGE_NAME}_dgpu

build-xavier-lib:
	docker run --rm -v `pwd`/dist:/opt/app/dist ${DOCKER_IMAGE_NAME}_xavier

build-nano-lib:
	docker run --rm -v `pwd`/dist:/opt/app/dist ${DOCKER_IMAGE_NAME}_nano
