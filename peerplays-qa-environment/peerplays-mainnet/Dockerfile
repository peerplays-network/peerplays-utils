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
    git log --oneline -n 5 && \
    # Obtain version
    mkdir /etc/peerplays && \
    git rev-parse --short HEAD > /etc/peerplays/version

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

# Peerplays RPC
EXPOSE 8090
# Peerplays P2P:
EXPOSE 9777
EXPOSE 19777
EXPOSE 29777
EXPOSE 39777
EXPOSE 49777
EXPOSE 59777

# default exec/config files
ADD default_config.ini config.ini
ADD logging.ini logging.ini
ADD peerplaysentry.sh /usr/local/bin/peerplaysentry.sh
RUN chmod a+x /usr/local/bin/peerplaysentry.sh

RUN chown peerplays:root -R /home/peerplays/peerplays-network

# Peerplays
CMD ["/usr/local/bin/peerplaysentry.sh"]
