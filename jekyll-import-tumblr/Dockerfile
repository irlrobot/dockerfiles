FROM ruby:alpine

WORKDIR /blog

RUN apk add make gcc libc-dev g++
RUN gem install jekyll-import minima

CMD ruby -e "\
    require 'jekyll-import'; \
    JekyllImport::Importers::Tumblr.run({ \
        \"url\" => \"$BLOG\", \
        \"format\" => \"md\", \
        \"grab_images\" => true, \
        \"add_highlights\" => true, \
        \"rewrite_urls\" => true \
    })"