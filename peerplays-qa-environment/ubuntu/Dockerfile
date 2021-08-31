FROM ubuntu:20.04
MAINTAINER PeerPlays Blockchain Standards Association

RUN \
    apt-get update -y && \
      DEBIAN_FRONTEND=noninteractive apt-get install -y \
      apt-utils \
      autoconf \
      bash \
      build-essential \
      ca-certificates \
      cmake \
      dnsutils \
      doxygen \
      expect \
      git \
      graphviz \
      libboost1.67-all-dev \
      libbz2-dev \
      libcurl4-openssl-dev \
      libncurses-dev \
      libreadline-dev \
      libsnappy-dev \
      libssl-dev \
      libtool \
      libzip-dev \
      libzmq3-dev \
      locales \
      mc \
      nano \
      net-tools \
      ntp \
      openssh-server \
      pkg-config \
      perl \
      python3 \
      python3-jinja2 \
      sudo \
      wget

ENV HOME /home/peerplays
RUN useradd -rm -d /home/peerplays -s /bin/bash -g root -G sudo -u 1000 peerplays
RUN echo "peerplays  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/peerplays
RUN chmod 440 /etc/sudoers.d/peerplays

RUN service ssh start
RUN echo 'peerplays:peerplays' | chpasswd

# SSH
EXPOSE 22

# SSH server
CMD ["/usr/sbin/sshd","-D"]
