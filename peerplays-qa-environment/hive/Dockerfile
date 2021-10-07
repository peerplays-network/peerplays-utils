FROM ubuntu-for-peerplays:latest
MAINTAINER PeerPlays Blockchain Standards Association

WORKDIR /home/peerplays/hive-network

RUN \
    mkdir src

# Clone Hive
ADD hive.diff src
RUN \
    cd src && \
    git clone https://github.com/openhive-network/hive && \
    cd hive && \
    git checkout v1.24.8 && \
    git apply ../hive.diff && \
    GIT_SSL_NO_VERIFY=true git submodule update --init --recursive

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
    mv ./src/hive/build/programs/cli_wallet/cli_wallet ./ && \
    mv ./src/hive/build/programs/hived/hived ./ && \
    rm -rf src
ADD config.ini ./hived_data_dir/config.ini
ADD init-network.sh ./init-network.sh

RUN chown peerplays:root -R /home/peerplays/hive-network

# Hive RPC
EXPOSE 28090
# Hive P2P
EXPOSE 28091

# Hive
CMD ["./hived", "-d", "./hived_data_dir"]

