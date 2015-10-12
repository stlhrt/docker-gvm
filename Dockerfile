FROM stlhrt/jdk8:latest
MAINTAINER Łukasz Woźniak

USER root

RUN apt-get update
RUN apt-get install -y -q curl unzip

USER service
ENV HOME /home/service

RUN curl -s get.sdkman.io | bash

USER root
ADD config /home/service/.sdkman/etc/config
RUN chown service:service -R /home/service/.sdkman
RUN chmod 644 /home/service/.sdkman/etc/config

ADD sdk_wrapper.sh /home/service/sdk_wrapper.sh
RUN chown service:service /home/service/sdk_wrapper.sh
RUN chmod 744 /home/service/sdk_wrapper.sh

USER service

RUN /home/service/sdk_wrapper.sh offline enable

WORKDIR /app/service

ONBUILD WORKDIR /app/service
