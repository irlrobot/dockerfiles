FROM golang:alpine AS build
LABEL maintainer="josh@userdel.com"

ENV TERRAFORM_VERSION=0.11.8

RUN apk add --update git bash openssh

# Only build for this OS and don't include debugging
ENV TF_DEV=true
ENV TF_RELEASE=true

WORKDIR $GOPATH/src/github.com/hashicorp/terraform
RUN git clone https://github.com/hashicorp/terraform.git ./ && \
    git checkout v${TERRAFORM_VERSION} && \
    /bin/bash scripts/build.sh

# This results in a single layer image
FROM alpine:latest
# Need certs for installing tf plugins
RUN apk add ca-certificates

# Copy only the binary from the build image
COPY --from=build /go/bin/terraform /bin/terraform

ENTRYPOINT ["/bin/terraform"]