FROM debian:wheezy

MAINTAINER Ganesha <reekoheek@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "Acquire::http { Proxy \"http://192.168.1.10:3142\"; };" > /etc/apt/apt.conf.d/02proxy && \
    echo "deb http://kambing.ui.ac.id/debian/ wheezy main" > /etc/apt/sources.list && \
    echo "# deb http://kambing.ui.ac.id/debian/ wheezy-updates" >> /etc/apt/sources.list && \
    echo "deb http://kambing.ui.ac.id/debian-security/ wheezy/updates main" >> /etc/apt/sources.list && \
    apt-get update -y

ADD ignite /ignite

ENTRYPOINT ["/ignite/ignite"]
