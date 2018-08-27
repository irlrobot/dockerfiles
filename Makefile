NAME := __REPO__/__IMAGE__
TAG := $$(git rev-parse --short HEAD)
IMG := ${NAME}:${TAG}
LATEST := ${NAME}:latest
 
build:
	@docker build -t ${IMG} .
	@docker tag ${IMG} ${LATEST}
 
push:
	@docker push ${NAME}
 
login:
	@docker log -u ${DOCKER_USER} -p ${DOCKER_PASS}