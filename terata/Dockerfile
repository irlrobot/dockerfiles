FROM ubuntu:18.04

RUN apt-get update
RUN apt-get upgrade -y

# Install dependencies
RUN apt-get install curl unzip python3-pip -y

# Terraform
RUN curl -Os https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
RUN unzip terraform_0.11.13_linux_amd64.zip -d /usr/bin/
RUN rm terraform_0.11.13_linux_amd64.zip

# okta-awscli
RUN pip3 install okta-awscli awscli

# Add the okta-awscli dot file
RUN echo '[default]\nbase-url = zillow.okta.com' > ~/.okta-aws
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# Clean up and reduce image size
RUN apt-get clean
RUN apt-get autoremove
