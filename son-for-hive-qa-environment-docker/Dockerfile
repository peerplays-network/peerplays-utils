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

WORKDIR /home/peerplays

RUN \
    mkdir src

# Download Boost
RUN \
    cd src && \
    wget -c 'http://sourceforge.net/projects/boost/files/boost/1.67.0/boost_1_67_0.tar.gz/download' -O boost_1_67_0.tar.gz && \
    tar -zxvf boost_1_67_0.tar.gz

# Build Boost
RUN \
    cd src/boost_1_67_0/ && \
    ./bootstrap.sh && \
    ./b2 -j$(nproc) install && \
    cd .. && \
    rm -rf src/boost*

# Clone Hive
ADD hive.diff src
RUN \
    cd src && \
    git clone https://github.com/openhive-network/hive && \
    cd hive && \
    git checkout v1.24.8 && \
    git apply ../hive.diff && \
    git submodule update --init --recursive

# Configure Hive
RUN \
    cd src/hive && \
    mkdir build && \
    cd build && \
    cmake -DBUILD_HIVE_TESTNET=ON -DSKIP_BY_TX_ID=OFF ..

# Build Hive
RUN \
    cd src/hive/build && \
    make -j$(nproc) cli_wallet hived

# Setup Hive runimage
RUN \
    mkdir hive-network && \
    cd hive-network && \
    mv ../src/hive/build/programs/cli_wallet/cli_wallet ./ && \
    mv ../src/hive/build/programs/hived/hived ./ && \
    rm -rf src/hive
ADD hive-config.ini hive-network/hived_data_dir/config.ini
ADD hive-init-network.sh hive-network/init-network.sh

# Clone Peerplays
RUN \
    cd src && \
    git clone https://gitlab.com/PBSA/peerplays.git && \
    cd peerplays && \
    git checkout feature/son-for-hive && \
    git submodule update --init --recursive

# Configure Peerplays
RUN \
    cd src/peerplays && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Debug -DENABLE_DEV_FEATURES=1 ..

# Build Peerplays
RUN \
    cd src/peerplays/build && \
    make -j$(nproc) cli_wallet witness_node

# Update Peerplays
ADD "https://www.random.org/cgi-bin/randbyte?nbytes=128&format=h" random
RUN \
    cd src/peerplays && \
    git pull && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Debug -DENABLE_DEV_FEATURES=1 ..

# Build Peerplays
RUN \
    cd src/peerplays/build && \
    make -j$(nproc) cli_wallet witness_node

# Setup Peerplays runimage
RUN \
    mkdir peerplays-network && \
    cd peerplays-network && \
    ln -s ../src/peerplays/build/programs/cli_wallet/cli_wallet && \
    ln -s ../src/peerplays/build/programs/witness_node/witness_node
ADD peerplays-config.ini peerplays-network/witness_node_data_dir/config.ini
ADD peerplays-genesis.json peerplays-network/genesis.json
ADD peerplays-init-network.sh peerplays-network/init-network.sh

RUN chown peerplays:root -R /home/peerplays/hive-network
RUN chown peerplays:root -R /home/peerplays/peerplays-network

# SSH
EXPOSE 22

# Peerplays RPC
EXPOSE 8090
# Peerplays P2P:
EXPOSE 9777

# Hive RPC
EXPOSE 28090
# Hive P2P
EXPOSE 28091

# SSH server
CMD ["/usr/sbin/sshd","-D"]
