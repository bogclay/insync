FROM phusion/baseimage:0.9.15
MAINTAINER bogclay <bogclay@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

RUN apt-get update -qq

# install wget
RUN apt-get update
RUN apt-get -y install wget

# install insync-headless
RUN add-apt-repository "deb http://apt.insynchq.com/ubuntu trusty non-free contrib"
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35
RUN apt-get update
RUN apt-get -y install insync-headless
RUN apt-get clean

# manifest: expose, run
# ENTRYPOINT ["/sbin/my_init"]
# CMD ["/bin/bash"]
