FROM ubuntu-for-peerplays:latest
MAINTAINER PeerPlays Blockchain Standards Association

WORKDIR /home/peerplays/bitcoin-network

# Setup Bitcoin
RUN \
    wget https://bitcoincore.org/bin/bitcoin-core-0.21.1/bitcoin-0.21.1-x86_64-linux-gnu.tar.gz && \
    tar -xzvf bitcoin-0.21.1-x86_64-linux-gnu.tar.gz bitcoin-0.21.1/bin/ --strip-components=2 && \
    rm bitcoin-0.21.1-x86_64-linux-gnu.tar.gz

ADD peerplays-qa-environment/bitcoin/bitcoin.conf /home/peerplays/bitcoin-network/network/bitcoin.conf
ADD peerplays-qa-environment/bitcoin/init-network.sh /home/peerplays/bitcoin-network/init-network.sh

RUN chown peerplays:root -R /home/peerplays/bitcoin-network

# Bitcoin P2P
EXPOSE 8332
# Bitcoin ZMQ
EXPOSE 11111
# Bitcoin RPC
EXPOSE 18444

# Bitcoin
CMD ["./bitcoind","-datadir=./network/"]

