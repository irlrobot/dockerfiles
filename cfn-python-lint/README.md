# How to Use This Dockerfile
The purpose of this Dockerfile is to run the CloudFormation template linting tool [cfn-lint](https://github.com/awslabs/cfn-python-lint).

First, build the image yourself or pull it down from my Dockerhub:
```
docker build . --tag cfn-python-lint
```
Or
```
docker pull irlrobot/cfn-python-lint
```

Default behavior is to just lint any template you want:
```
docker run --rm \
    -v /absolute/path/to/template.(yaml|json):/cfn/template \
    cfn-python-lint
```

If you want to use other features of cfn-lint, you can specify your own entrypoint. For example, if you want to ignore all warnings you can use something like:
```
docker run --rm \
    -v /absolute/path/to/template.(yaml|json):/cfn/template \
    --entrypoint "cfn-lint" \
    cfn-python-lint --ignore-checks W --template /cfn/template
```