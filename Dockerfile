# Use an Ubuntu 18.04 image
FROM ubuntu:18.04

# update
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y upgrade

# install packages
RUN apt-get -y install libxm4:i386 libxft2:i386 libstdc++6:i386 libglib2.0-0:i386
RUN apt-get -y install lsb lsb-core

# clean all
RUN apt-get -y clean

# fix sh
RUN cp /bin/sh /bin/sh.old
RUN ln -sfn /bin/bash /bin/sh

# copy
COPY libero /bin/libero

# make a user
RUN adduser --disabled-password --gecos '' libero
WORKDIR /home/libero
