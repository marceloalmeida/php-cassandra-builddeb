FROM debian:jessie-backports

MAINTAINER Marcelo Almeida <marcelo.almeida@jumia.com>

WORKDIR "/root"

ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 1.1.0

# INSTALL BUILDER DEPENDENCIES
RUN apt-get update && apt-get install -y --no-install-recommends \
  checkinstall \
  make \
  php5-dev \
  php-pear \
  wget

COPY src /src

# INSTALL PACKAGES DEPENDENCIES
RUN mkdir /pkg
RUN apt-get update && apt-get install -y libgmp10 libgmp-dev

RUN wget http://downloads.datastax.com/cpp-driver/ubuntu/14.04/dependencies/libuv/v1.8.0/libuv-dev_1.8.0-1_amd64.deb \
    http://downloads.datastax.com/cpp-driver/ubuntu/14.04/dependencies/libuv/v1.8.0/libuv_1.8.0-1_amd64.deb \
    http://downloads.datastax.com/cpp-driver/ubuntu/14.04/v2.3.0/cassandra-cpp-driver-dev_2.3.0-1_amd64.deb \
    http://downloads.datastax.com/cpp-driver/ubuntu/14.04/v2.3.0/cassandra-cpp-driver_2.3.0-1_amd64.deb ;\
  dpkg -i /root/*.deb

# CREATE PACKAGE
RUN pecl download cassandra-$VERSION ;\
  tar -zxvf cassandra-$VERSION.tgz ;\
  cd cassandra-$VERSION ;\
  cp -r /src/* /root/cassandra-$VERSION/. ;\
  phpize ;\
  ./configure ;\
  checkinstall -y --install=no --pkgname='php5-cassandra' --pkgversion='$VERSION-aig' --pkggroup='php' --pkgsource='https://github.com/datastax/php-driver' --maintainer='Marcelo Almeida \<marcelo.almeida@jumia.com\>' --requires='php5-common \(\>= 5.6.0\), cassandra-cpp-driver \(\>= 2.3.0\), libuv \(\>= 1.8.0\), libgmp10:amd64 \(\>= 2.6.0\)' --include=include_etc

# PERFORM TEST
RUN cd cassandra-$VERSION ;\
  make && make test

VOLUME ["/pkg"]
