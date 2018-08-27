FROM python:3.6-alpine3.8
LABEL maintainer="josh@userdel.com"

RUN pip install cfn-lint
WORKDIR /cfn

ENTRYPOINT cfn-lint /cfn/template