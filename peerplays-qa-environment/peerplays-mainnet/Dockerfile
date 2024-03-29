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
    git checkout develop && \
    git submodule update --init --recursive && \
    git branch --show-current && \
    git log --oneline -n 5

# Configure Peerplays
RUN \
    cd src/peerplays && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release ..

# Build Peerplays
RUN \
    cd src/peerplays/build && \
    make -j$(nproc) cli_wallet witness_node

# Update Peerplays
ADD "https://www.random.org/cgi-bin/randbyte?nbytes=128&format=h" random
RUN \
    cd src/peerplays && \
    git pull && \
    git branch --show-current && \
    git log --oneline -n 5 && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release ..

# Build Peerplays
RUN \
    cd src/peerplays/build && \
    make -j$(nproc) cli_wallet witness_node

# Setup Peerplays runimage
RUN \
    ln -s ./src/peerplays/build/programs/cli_wallet/cli_wallet && \
    ln -s ./src/peerplays/build/programs/witness_node/witness_node

RUN chown peerplays:root -R /home/peerplays/peerplays-network

# Peerplays RPC
EXPOSE 8090
# Peerplays P2P:
EXPOSE 9777

# Peerplays
CMD ["./witness_node", "-d", "./witness_node_data_dir"]
