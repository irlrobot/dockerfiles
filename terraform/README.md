# How to Use This Dockerfile
The purpose of this Dockerfile is to run HashiCorp's [Terraform](https://www.terraform.io/).

First, build the image yourself or pull it down from my Dockerhub:
```
docker build . --tag terraform
```
Or
```
docker pull irlrobot/terraform
```

From a directory that has your Terraform files, you can run commands like:
`docker run -it --rm -v $(pwd):/app/ -w /app/ irlrobot/terraform init`