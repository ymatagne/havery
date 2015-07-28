FROM fedora:latest

MAINTAINER yan.matagne@gmail.com,ag94441@gmail.com 

RUN /usr/bin/dnf update -y
RUN yum -y install haproxy.x86_64 curl bash

RUN curl -OL https://github.com/kelseyhightower/confd/releases/download/v0.10.0/confd-0.10.0-linux-amd64
RUN mv confd-0.10.0-linux-amd64 confd
RUN cp confd /usr/bin && chmod +x /usr/bin/confd
RUN cp confd /usr/sbin && chmod +x /usr/sbin/confd

ADD confd /etc/confd

ADD start.sh start.sh
RUN chmod +x /start.sh

CMD /start.sh
