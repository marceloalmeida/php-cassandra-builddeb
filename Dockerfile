FROM debian:jessie

MAINTAINER marcelo Almeida <marcelo.almeida@jumia.com> 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
        checkinstall \
        make \
        php5-dev \
        wget

VOLUME ["/src", "/pkg"]
