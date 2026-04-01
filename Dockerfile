FROM ubuntu:noble
RUN echo "deb-src http://archive.ubuntu.com/ubuntu/ noble main universe" >> /etc/apt/sources.list && \
    echo "deb-src http://archive.ubuntu.com/ubuntu/ noble-updates main universe" >> /etc/apt/sources.list && \
    echo "deb-src http://archive.ubuntu.com/ubuntu/ noble-security main universe" >> /etc/apt/sources.list
RUN apt update && apt -y install build-essential && apt-get -y build-dep livecd-rootfs
COPY fwts-livecd-rootfs /fwts-livecd-rootfs
RUN cd /fwts-livecd-rootfs && debian/rules binary
VOLUME /image
CMD cp /livecd-rootfs_*_amd64.deb /image/
