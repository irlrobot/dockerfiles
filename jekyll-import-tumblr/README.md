# How to Use This Dockerfile
The purpose of this Dockerfile is to run the [Jekyll Import Tool for Tumblr](https://github.com/jekyll/jekyll-import) to migrate a blog from Tumblr to Jekyll.

First, build the image yourself or pull it down from my Dockerhub:
```
docker build . --tag jekyll-import-tumblr
```
Or
```
docker pull irlrobot/jekyll-import-tumblr
```

Use the below command to download your Tumblr to the directory you're currently in:
```
docker run --rm \
    -v $(pwd):/blog \
    -e BLOG='http://your.blog.domain' \
    irlrobot/jekyll-import-tumblr
```
