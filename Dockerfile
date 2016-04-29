FROM debian:jessie

MAINTAINER marcelo Almeida <marcelo.almeida@jumia.com> 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
        checkinstall \
        make \
        php5-dev \
        wget

#WORKDIR "/root"

#RUN apt-get install -y \
#        libgmp-dev

#RUN wget -q http://downloads.datastax.com/cpp-driver/ubuntu/14.04/dependencies/libuv/v1.8.0/libuv-dev_1.8.0-1_amd64.deb http://downloads.datastax.com/cpp-driver/ubuntu/14.04/v2.3.0/cassandra-cpp-driver-dev_2.3.0-1_amd64.deb

#RUN dpkg -i /root/*.deb

VOLUME ["/src", "/pkg"]
