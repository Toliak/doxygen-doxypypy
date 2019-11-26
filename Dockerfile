FROM python:3.7.4-buster

RUN apt-get update -y && \
    apt-get install -y flex bison texlive-font-utils cmake git && \
    cd /tmp && \
    git clone https://github.com/doxygen/doxygen.git && \
    cd doxygen && \
    git checkout Release_1_8_16 && \
    mkdir build && \
    cd build && \
    cmake -G "Unix Makefiles" .. && \
    make -j 4 && \
    make install && \
    pip3 install doxypypy

WORKDIR /root/
