# Buildtask for Cassandra driver for PHP5.6

[![Build Status](https://travis-ci.org/marcelosousaalmeida/php5-cassandra-builddeb.svg?branch=master)](https://travis-ci.org/marcelosousaalmeida/php5-cassandra-builddeb)

Task to build Debian packages of Cassandra driver for PHP 5.6.


## Dependencies

* [libuv_1.8.0-1_amd64.deb](http://downloads.datastax.com/cpp-driver/ubuntu/14.04/dependencies/libuv/v1.8.0/libuv_1.8.0-1_amd64.deb)
* [cassandra-cpp-driver_2.3.0-1_amd64.deb](http://downloads.datastax.com/cpp-driver/ubuntu/14.04/v2.3.0/cassandra-cpp-driver_2.3.0-1_amd64.deb)


## Usage

```sh
$ docker-compose build
$ docker-compose run --rm builder
$ ls -1 pkg/
```

