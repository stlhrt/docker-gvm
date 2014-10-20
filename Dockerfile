FROM stlhrt/jdk8:latest
MAINTAINER Łukasz Woźniak

USER root

RUN apt-get update
RUN apt-get install -y -q curl unzip

USER service
ENV HOME /home/service

RUN curl -s get.gvmtool.net | bash

USER root
ADD config /home/service/.gvm/etc/config
RUN chown service:service -R /home/service/.gvm
RUN chmod 644 /home/service/.gvm/etc/config

ADD gvm_wrapper.sh /home/service/gvm_wrapper.sh
RUN chown service:service /home/service/gvm_wrapper.sh
RUN chmod 744 /home/service/gvm_wrapper.sh

USER service

RUN /home/service/gvm_wrapper.sh offline enable

WORKDIR /app/service

ONBUILD WORKDIR /app/service
