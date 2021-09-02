# SON QA environment

This docker-compose image contains self contained, ready to go, SON QA environment

## Build the docker images
Building the images will take some time, as the software will be built from scratch.
```
docker-compose build
```

## Start the containers
Creates new instances and starts them
```
docker-compose up
```

## Stop the containers
Stops running instances and deletes them
```
docker-compose down
```

## Connecting to the containers
First part of the container name might be different (peerplays-qa-environment)
### Bitcoin
```
docker exec -it peerplays-qa-environment_bitcoin-for-peerplays_1 /bin/bash
```
### Hive
```
docker exec -it peerplays-qa-environment_hive-for-peerplays_1 /bin/bash
```
### Peerplays
```
docker exec -it peerplays-qa-environment_peerplays01_1 /bin/bash
docker exec -it peerplays-qa-environment_peerplays02_1 /bin/bash
docker exec -it peerplays-qa-environment_peerplays03_1 /bin/bash
etc...
```

### Redis
```
docker exec -it peerplays-qa-environment_redis-for-peerplays_1 /bin/bash
```

### Faucet
```
docker exec -it peerplays-qa-environment_ubuntu-for-peerplays_1 /bin/bash
```

## Initializing networks
Wait for one initialization to finish, before starting the next one. Initialization should be done in the following order:
- Bitcoin
- Hive
- Peerplays
- Redis
- Faucet
Once the Peerplays network initialization is finished, wait for maintenance block.

Before starting initialization, make sure that all nodes are down.
```
docker-compose down
```

### Bitcoin
```
docker-compose up bitcoin-for-peerplays
docker exec -it peerplays-qa-environment_bitcoin-for-peerplays_1 /bin/bash
./init-network.sh
```
### Hive
```
docker-compose up hive-for-peerplays
# Wait for "Generated block..." messages
docker exec -it peerplays-qa-environment_hive-for-peerplays_1 /bin/bash
./init-network.sh
```
### Peerplays
```
docker-compose up peerplays01 peerplays02 peerplays03 peerplays04 peerplays05 peerplays06 peerplays07 peerplays08 peerplays09 peerplays10 peerplays11 peerplays12 peerplays13 peerplays14 peerplays15 peerplays16
# Wait for "Generated block..." messages
# Wait for nodes to sync (no "Not producing block..." messages)
docker exec -it peerplays-qa-environment_peerplays01_1 /bin/bash
./init-network.sh
# Wait for maintenance block
```
### Redis
```
docker-compose up docker-compose up redis-for-peerplays
# Wait for message "Ready to accept connections"
```
### Faucet
```
docker-compose up faucet-for-peerplays
# Wait for message "Running on http://10.11.12.50:5000/ (Press CTRL+C to quit)"
```

## Node properties
```
Bitcoin        10.11.12.201
Hive           10.11.12.202

Faucet         10.11.12.50
Redis          10.11.12.51

Peerplays01    10.11.12.101    Witness 1.6.1,  1.6.12,    SON 1.33.0,   Stale production ON
Peerplays02    10.11.12.102    Witness 1.6.2,  1.6.13,    SON 1.33.1,   Stale production OFF
Peerplays03    10.11.12.103    Witness 1.6.3,  1.6.14,    SON 1.33.2,   Stale production OFF
Peerplays04    10.11.12.104    Witness 1.6.4,  1.6.15,    SON 1.33.3,   Stale production OFF
Peerplays05    10.11.12.105    Witness 1.6.5,  1.6.16,    SON 1.33.4,   Stale production OFF
Peerplays06    10.11.12.106    Witness 1.6.6,  1.6.17,    SON 1.33.5,   Stale production OFF
Peerplays07    10.11.12.107    Witness 1.6.7,  1.6.18,    SON 1.33.6,   Stale production OFF
Peerplays08    10.11.12.108    Witness 1.6.8,  1.6.19.    SON 1.33.7,   Stale production OFF
Peerplays09    10.11.12.109    Witness 1.6.9,  1.6.20,    SON 1.33.8,   Stale production OFF
Peerplays10    10.11.12.110    Witness 1.6.10, 1.6.21,    SON 1.33.9,   Stale production OFF
Peerplays11    10.11.12.111    Witness 1.6.11, 1.6.22,    SON 1.33.10,  Stale production OFF
Peerplays13    10.11.12.112    Witness NONE          ,    SON 1.33.11,  Stale production OFF
Peerplays13    10.11.12.113    Witness NONE          ,    SON 1.33.12,  Stale production OFF
Peerplays14    10.11.12.114    Witness NONE          ,    SON 1.33.13,  Stale production OFF
Peerplays15    10.11.12.115    Witness NONE          ,    SON 1.33.14,  Stale production OFF
Peerplays16    10.11.12.116    Witness NONE          ,    SON 1.33.15,  Stale production OFF
```
## Monitoring resource usage
To monitor computer resource usage by docker containers in real time, use the following command:
```
docker stats
```
The output will be similar to this:
```
CONTAINER ID   NAME                                               CPU %     MEM USAGE / LIMIT     MEM %     NET I/O           BLOCK I/O        PIDS
0e6e806bd8d7   peerplays-qa-environment_faucet-for-peerplays_1    0.01%     53.77MiB / 30.77GiB   0.17%     7.34kB / 4.73kB   0B / 2.66MB      17
1c793a7f4520   peerplays-qa-environment_redis-for-peerplays_1     0.18%     2.48MiB / 30.77GiB    0.01%     5.29kB / 670B     0B / 0B          5
61bdcacc4617   peerplays-qa-environment_peerplays01_1             2.06%     65.34MiB / 30.77GiB   0.21%     1.4MB / 743kB     0B / 0B          14
851c6f4c7a36   peerplays-qa-environment_peerplays02_1             1.25%     65.21MiB / 30.77GiB   0.21%     1.39MB / 724kB    0B / 0B          14
513fdd80faab   peerplays-qa-environment_peerplays03_1             1.87%     65.27MiB / 30.77GiB   0.21%     1.4MB / 730kB     0B / 0B          14
14cbff0ec769   peerplays-qa-environment_peerplays05_1             1.46%     65.2MiB / 30.77GiB    0.21%     1.4MB / 728kB     0B / 0B          14
6f153091d3a5   peerplays-qa-environment_peerplays07_1             1.35%     65.32MiB / 30.77GiB   0.21%     1.42MB / 721kB    0B / 0B          14
ea56bb7d139a   peerplays-qa-environment_peerplays15_1             1.26%     65.17MiB / 30.77GiB   0.21%     1.38MB / 695kB    0B / 0B          14
d472e4031736   peerplays-qa-environment_peerplays04_1             1.76%     65.21MiB / 30.77GiB   0.21%     1.4MB / 725kB     0B / 0B          14
8dec8c46b208   peerplays-qa-environment_peerplays16_1             1.26%     65.28MiB / 30.77GiB   0.21%     1.38MB / 683kB    0B / 0B          14
4c1a0b42551f   peerplays-qa-environment_peerplays06_1             2.24%     65.22MiB / 30.77GiB   0.21%     1.39MB / 732kB    0B / 0B          14
407fbfcc1572   peerplays-qa-environment_peerplays10_1             0.95%     65.21MiB / 30.77GiB   0.21%     1.39MB / 730kB    0B / 0B          14
fb79c628adf2   peerplays-qa-environment_peerplays09_1             1.57%     65.21MiB / 30.77GiB   0.21%     1.4MB / 751kB     0B / 0B          14
6489809208f0   peerplays-qa-environment_peerplays13_1             1.57%     65.16MiB / 30.77GiB   0.21%     1.38MB / 704kB    0B / 0B          14
1b4a22127d71   peerplays-qa-environment_peerplays12_1             1.50%     65.22MiB / 30.77GiB   0.21%     1.39MB / 683kB    0B / 0B          14
63782a95bdcd   peerplays-qa-environment_peerplays08_1             2.09%     65.23MiB / 30.77GiB   0.21%     1.4MB / 738kB     0B / 0B          14
cfa91a760895   peerplays-qa-environment_peerplays14_1             1.30%     65.21MiB / 30.77GiB   0.21%     1.39MB / 678kB    0B / 0B          14
99dc6c45e39a   peerplays-qa-environment_peerplays11_1             1.18%     65.23MiB / 30.77GiB   0.21%     1.38MB / 736kB    0B / 0B          14
4951a2727f8a   peerplays-qa-environment_peerplays-base_1          0.00%     1.441MiB / 30.77GiB   0.00%     10.3kB / 0B       0B / 4.1kB       1
0e0449865359   peerplays-qa-environment_hive-for-peerplays_1      7.24%     8.797MiB / 30.77GiB   0.03%     5.23MB / 15.8MB   3.6MB / 0B       46
ea086b2c9798   peerplays-qa-environment_bitcoin-for-peerplays_1   0.16%     40.5MiB / 30.77GiB    0.13%     54.4kB / 46.7kB   4.1kB / 49.2kB   29
5ebba3d28e21   peerplays-qa-environment_ubuntu-for-peerplays_1    0.00%     1.441MiB / 30.77GiB   0.00%     15kB / 0B         0B / 4.1kB       1
```
