docker.buildx-amd64:
	@docker buildx build --push --platform linux/amd64 -t latenssi/phi-3-mini-4k-test:amd64 .

docker.buildx-l4t:
	@docker buildx build --push --platform linux/arm64 --build-arg BASE=nvcr.io/nvidia/l4t-cuda:11.4.14-runtime -t latenssi/phi-3-mini-4k-test:l4t-cuda-11.4.14 .
	@docker buildx build --push --platform linux/arm64 --build-arg BASE=nvcr.io/nvidia/l4t-cuda:11.4.19-runtime -t latenssi/phi-3-mini-4k-test:l4t-cuda-11.4.19 .
	@docker buildx build --push --platform linux/arm64 --build-arg BASE=nvcr.io/nvidia/l4t-cuda:12.2.12-runtime -t latenssi/phi-3-mini-4k-test:l4t-cuda-12.2.12 .

docker.buildx-all: docker.buildx-amd64 docker.buildx-l4t
# 	@docker buildx build --push --platform linux/amd64,linux/arm64 -t latenssi/phi-3-mini-4k-test .
