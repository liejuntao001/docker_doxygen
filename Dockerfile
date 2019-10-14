FROM ubuntu:bionic-20190912.1
LABEL maintainer="Liejun Tao (liejuntao001@gmail.com)"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    doxygen graphviz build-essential texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra texlive-font-utils \
 && rm -rf /var/lib/apt/lists/*

ARG user=dev
ARG group=dev
ARG uid=10000
ARG gid=10000
ARG HOME=/home/${user}
RUN groupadd -g ${gid} ${group} && \
    useradd -d $HOME -u ${uid} -g ${gid} -m ${user} -s /bin/bash

USER ${user}

WORKDIR /home/${user}
