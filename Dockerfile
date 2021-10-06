# base image ubuntu
FROM ubuntu:20.04

WORKDIR /dev
COPY . /dev

# install dependencies
RUN yum -y install python3-pip && \
    yum -y install epel-release && \
    yum install -y ImageMagick && \
    yum install -y ImageMagick-libs && \
    yum install -y ghostscript && \
    yum install -y dnf-plugins-core && \
    yum install -y 'dnf-command(config-manager)' && \
    yum config-manager --set-enabled powertools && \
    yum install -y leptonica && \
    yum install -y tesseract && \
    yum install -y tesseract-langpack-jpn && \ 
    yum install -y python36 && \
    yum clean all

RUN pip3.6 install --user hdfs==2.5.8 && \
    pip3.6 install --user pytesseract==0.3.7 && \
    pip3.6 install --user pandas==0.24.0


# ! Useful CMD:
# * Build: docker build -t poc-centos8-img .
# * Bindmount: docker run -it -p 3000:3000 -v C:/PoC/poc-centos8/src:/usr/home/poc-centos8/src poc-centos8-img
# * Named Volume: docker run -dp 3000:3000 -v tesseract-vol:/usr/src/poc-centos8/src poc-env
# * Foreground (Interact with CLI): docker run -it -p 3000:3000 poc-env