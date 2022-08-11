DOCKER_IMAGE_NAME=savantboost_builder

DS_DPGU_VERSION=6.1
DS_XAVIER_VERSION=6.1
DS_NANO_VERSION=6.0.1

build-dgpu-builder-image:
	docker buildx build \
		-t ${DOCKER_IMAGE_NAME}_dgpu \
		-f Dockerfile.dgpu \
		--build-arg base_image=nvcr.io/nvidia/deepstream:${DS_DPGU_VERSION}-devel \
		--progress=plain \
		--platform linux/amd64 \
		.

build-xavier-builder-image:
	docker buildx build \
		-t ${DOCKER_IMAGE_NAME}_xavier \
		-f Dockerfile.jetson.xavier \
		--build-arg base_image=nvcr.io/nvidia/deepstream-l4t:${DS_XAVIER_VERSION}-samples \
		--build-arg soc=t194 \
		--build-arg l4t_version=34.1 \
		--progress=plain \
		--platform linux/arm64 \
		.

build-nano-builder-image:
	docker buildx build \
		-t ${DOCKER_IMAGE_NAME}_nano \
		-f Dockerfile.jetson.nano \
		--build-arg base_image=nvcr.io/nvidia/deepstream-l4t:${DS_NANO_VERSION}-samples \
		--build-arg soc=t210 \
		--build-arg l4t_version=32.6 \
		--progress=plain \
		--platform linux/arm64 \
		.

build-dgpu-lib:
	docker run --rm -e CI_PROJECT_ID=607 -e CI_JOB_TOKEN=${CI_JOB_TOKEN} ${DOCKER_IMAGE_NAME}_dgpu

build-xavier-lib:
	docker run --rm -e CI_PROJECT_ID=607 -e CI_JOB_TOKEN=${CI_JOB_TOKEN} ${DOCKER_IMAGE_NAME}_xavier

build-nano-lib:
	docker run --rm -e CI_PROJECT_ID=607 -e CI_JOB_TOKEN=${CI_JOB_TOKEN} ${DOCKER_IMAGE_NAME}_nano
