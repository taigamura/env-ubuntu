# base image ubuntu 20.04
FROM ubuntu:20.04

WORKDIR /work
COPY . /work

# install dependencies

RUN apt-get update && apt-get install -y \
    software-properties-common

RUN add-apt-repository universe

RUN apt-get update && apt-get install -y \
    apache2 \
    curl \
    git \
    python3.6 \
    python3-pip \
    tesseract-ocr \
    libtesseract-dev \
    imagemagick 

# pip dependencies
RUN pip3 install \
    numpy \
    keras \
    pandas \
    sklearn \
    tensorflow


# ! Useful CMD:
# * Build: docker build -t env-ubuntu .
# * Bindmount: docker run -it -p 3000:3000 -v C:/PoC/poc-centos8/src:/usr/home/poc-centos8/src env-ubuntu
# * Named Volume: docker run -dp 3000:3000 -v tesseract-vol:/usr/src/poc-centos8/src poc-env
# * Foreground (Interact with CLI): docker run -it -p 3000:3000 poc-env