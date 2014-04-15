FROM ubuntu:13.10
MAINTAINER rebelhold

RUN apt-get update -y --fix-missing
RUN apt-get install -y build-essential git git-core vim wget curl unzip

WORKDIR /usr/local/src

RUN wget http://nimrod-lang.org/download/nimrod_0.9.2.zip
RUN unzip nimrod_0.9.2.zip

WORKDIR nimrod

RUN sh build.sh && cd ../
RUN cp -R /usr/local/src/nimrod /opt/nimrod
RUN ln -s /opt/nimrod/bin/nimrod /usr/local/bin/nimrod

