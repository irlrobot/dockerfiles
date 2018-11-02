FROM alpine:latest
LABEL maintainer "josh@userdel.com"

RUN BUILD_DEPS=' \
		python3-dev \
		py3-pip \
		musl-dev \
		openssl-dev \
		libffi-dev \
		gcc \
		' \
	&& apk --no-cache add \
	ca-certificates \
	python3 \
	py3-paramiko \
	py3-yaml \
	py3-jinja2 \
	py3-httplib2 \
	$BUILD_DEPS \
	&& pip3 install --upgrade pip \
	&& pip3 install ansible \
	&& apk del --purge $BUILD_DEPS

ENTRYPOINT [ "ansible" ]