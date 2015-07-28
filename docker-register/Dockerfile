FROM ubuntu:latest
MAINTAINER yan.matagne@gmail.com,ag94441@gmail.com

RUN apt-get update
RUN apt-get install -y curl wget libssl-dev libffi-dev bash

RUN mkdir /app
WORKDIR /app

RUN wget https://github.com/jwilder/docker-gen/releases/download/0.4.0/docker-gen-linux-amd64-0.4.0.tar.gz
RUN tar xvzf docker-gen-linux-amd64-0.4.0.tar.gz -C /usr/local/bin

ADD . /app

ENV DOCKER_HOST unix:///var/run/docker.sock

CMD docker-gen -notify "/bin/bash /tmp/etcd.sh" -interval 1 etcd.tpl /tmp/etcd.sh
