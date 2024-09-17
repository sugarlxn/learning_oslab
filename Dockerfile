FROM ubuntu:focal

# setup lable
LABEL maintainer="lxn12345"
LABEL version="1.0"
LABEL description="This is a dockerfile for building a container with hit-oslab, in order to learning operating system"

# Set the locale
ENV LANG C.UTF-8
# work dir
WORKDIR /root
# non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# copy tar file to image 
COPY ./hit-oslab.tar.gz /root/

# install basic tools
RUN cp -a /etc/apt/sources.list /etc/apt/sources.list.bak && \
    sed -i "s@http://.*archive.ubuntu.com@http://mirrors.huaweicloud.com@g" /etc/apt/sources.list && \
    sed -i "s@http://.*security.ubuntu.com@http://mirrors.huaweicloud.com@g" /etc/apt/sources.list && \
    apt-get update && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y lib32ncurses6 lib32z1 && \
    apt-get install -y libsm6:i386 && \
    apt-get install -y libx11-6:i386 && \
    apt-get install -y libxpm4:i386 && \
    apt-get install -y libc6-dev-i386 && \
    apt-get install -y bin86 && \
    apt-get install -y wget && \
    wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-3.4/gcc-3.4-base_3.4.6-6ubuntu3_amd64.deb && \
    dpkg --force-depends -i gcc-3.4-base_3.4.6-6ubuntu3_amd64.deb && \
    wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-3.4/gcc-3.4_3.4.6-6ubuntu3_amd64.deb && \
    dpkg --force-depends -i gcc-3.4_3.4.6-6ubuntu3_amd64.deb && \
    wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-3.4/cpp-3.4_3.4.6-6ubuntu3_amd64.deb && \
    dpkg --force-depends -i cpp-3.4_3.4.6-6ubuntu3_amd64.deb && \
    wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-3.4/g++-3.4_3.4.6-6ubuntu3_amd64.deb && \
    dpkg --force-depends -i g++-3.4_3.4.6-6ubuntu3_amd64.deb && \
    wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-3.4/libstdc++6-dev_3.4.6-6ubuntu3_amd64.deb && \
    dpkg --force-depends -i libstdc++6-dev_3.4.6-6ubuntu3_amd64.deb && \
    apt-get install -y make 

# CMD
CMD ["/bin/bash"]





