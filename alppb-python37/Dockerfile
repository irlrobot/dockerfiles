FROM amazonlinux:2017.03.1.20170812



RUN yum install zip wget gcc zlib-devel libffi-devel openssl-devel bzip2-devel -y

RUN cd /tmp && \
    wget https://www.python.org/ftp/python/3.7.1/Python-3.7.1.tgz && \
    tar xvfz Python-3.7.1.tgz && \
    cd Python-3.7.1 && \
    ./configure && \
    make && \
    make install
