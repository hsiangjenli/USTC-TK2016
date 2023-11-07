AUTHOR:=hsiangjenli
IMAGE_NAME:=ntust
TAG:=pcap2img

build:
	docker build --no-cache -t $(AUTHOR)/$(IMAGE_NAME):$(TAG) .

exec:
	docker run -it --rm --name $(IMAGE_NAME) -v $(PWD):/app -w /app $(AUTHOR)/$(IMAGE_NAME):$(TAG) bash

push:
	docker image push $(AUTHOR)/$(IMAGE_NAME):$(TAG)