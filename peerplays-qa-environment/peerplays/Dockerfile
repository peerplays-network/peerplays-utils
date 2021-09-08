FROM ubuntu-for-peerplays:latest
MAINTAINER PeerPlays Blockchain Standards Association

WORKDIR /home/peerplays/peerplays-network

RUN \
    mkdir src

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
    ln -s ./src/peerplays/build/programs/cli_wallet/cli_wallet && \
    ln -s ./src/peerplays/build/programs/witness_node/witness_node
ADD config.ini ./witness_node_data_dir/config.ini
ADD genesis.json ./genesis.json
ADD init-network.sh ./init-network.sh

RUN chown peerplays:root -R /home/peerplays/peerplays-network

# Peerplays RPC
EXPOSE 8090
# Peerplays P2P:
EXPOSE 9777

# Peerplays
#CMD ["./witness_node", "-d", "./witness_node_data_dir", "--replay-blockchain"]
