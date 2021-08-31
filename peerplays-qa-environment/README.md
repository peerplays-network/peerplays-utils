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
First part of the container name might be different (peerplays-full-network)
### Bitcoin
```
docker exec -it peerplays-full-network_bitcoin-for-peerplays_1 /bin/bash
```
### Hive
```
docker exec -it peerplays-full-network_hive-for-peerplays_1 /bin/bash
```
### Peerplays
```
docker exec -it peerplays-full-network_peerplays01_1 /bin/bash
docker exec -it peerplays-full-network_peerplays02_1 /bin/bash
docker exec -it peerplays-full-network_peerplays03_1 /bin/bash
etc...
```

## Initializing networks
Wait for one initialization to finish, before starting the next one. Initialization should be done in the following order:
- Bitcoin
- Hive
- Peerplays
Once the Peerplays network initialization is finished, wait for maintenance block.

Before starting initialization, make sure that all nodes are down.
```
docker-compose down
```

### Bitcoin
```
docker-compose up bitcoin-for-peerplays
docker exec -it peerplays-full-network_bitcoin-for-peerplays_1 /bin/bash
./init-network.sh
```
### Hive
```
docker-compose up hive-for-peerplays
# Wait for "Generated block..." messages
docker exec -it peerplays-full-network_hive-for-peerplays_1 /bin/bash
./init-network.sh
```
### Peerplays
```
docker-compose up peerplays01 peerplays02 peerplays03 peerplays04 peerplays05 peerplays06 peerplays07 peerplays08 peerplays09 peerplays10 peerplays11 peerplays12 peerplays13 peerplays14 peerplays15 peerplays16
# Wait for "Generated block..." messages
# Wait for nodes to sync (no "Not producing block..." messages)
docker exec -it peerplays-full-network_peerplays01_1 /bin/bash
./init-network.sh
# Wait for maintenance block
```

## Monitoring resource usage
To monitor computer resource usage by docker containers in real time, use the following command:
```
docker stats
```
The output will be similar to this:
```
CONTAINER ID   NAME                                             CPU %     MEM USAGE / LIMIT     MEM %     NET I/O           BLOCK I/O         PIDS
4112d51bba6b   peerplays-full-network_peerplays12_1             2.02%     69.41MiB / 31.14GiB   0.22%     3.72MB / 2.15MB   0B / 0B           14
532b1a080c4b   peerplays-full-network_peerplays09_1             1.48%     69.28MiB / 31.14GiB   0.22%     3.73MB / 2.42MB   0B / 0B           14
4dd7dcff421b   peerplays-full-network_peerplays01_1             1.46%     72.77MiB / 31.14GiB   0.23%     4MB / 3.15MB      0B / 4.28MB       15
96e20531fe8a   peerplays-full-network_peerplays10_1             1.54%     69.09MiB / 31.14GiB   0.22%     3.8MB / 2.37MB    0B / 0B           14
de8ce92f5e1b   peerplays-full-network_peerplays07_1             1.49%     69.46MiB / 31.14GiB   0.22%     3.75MB / 2.48MB   0B / 0B           14
b96c6330b8ab   peerplays-full-network_peerplays13_1             1.53%     69.14MiB / 31.14GiB   0.22%     3.69MB / 2.31MB   0B / 0B           14
a6ad80153e91   peerplays-full-network_peerplays11_1             1.66%     69.57MiB / 31.14GiB   0.22%     3.71MB / 2.6MB    0B / 0B           14
6d4596d6c482   peerplays-full-network_peerplays08_1             2.43%     69.23MiB / 31.14GiB   0.22%     3.78MB / 2.48MB   0B / 0B           14
c04d31447e8b   peerplays-full-network_peerplays14_1             1.54%     69.37MiB / 31.14GiB   0.22%     3.62MB / 2.32MB   0B / 0B           14
fc7a81fd26ae   peerplays-full-network_peerplays02_1             1.57%     69.32MiB / 31.14GiB   0.22%     3.72MB / 2.71MB   131kB / 0B        14
c75357572769   peerplays-full-network_peerplays15_1             1.90%     68.91MiB / 31.14GiB   0.22%     3.64MB / 2.17MB   0B / 0B           14
a0a3298f851c   peerplays-full-network_peerplays16_1             2.69%     69.05MiB / 31.14GiB   0.22%     3.69MB / 2.28MB   0B / 0B           14
463a3bb414f7   peerplays-full-network_peerplays06_1             1.54%     69.32MiB / 31.14GiB   0.22%     3.75MB / 2.26MB   0B / 0B           14
0a1ce9a8ed89   peerplays-full-network_peerplays04_1             4.49%     69.91MiB / 31.14GiB   0.22%     3.8MB / 2.86MB    0B / 0B           14
4ca0592cc105   peerplays-full-network_peerplays03_1             1.52%     70.06MiB / 31.14GiB   0.22%     3.66MB / 2.84MB   0B / 0B           14
f7fc71057175   peerplays-full-network_peerplays05_1             3.41%     68.86MiB / 31.14GiB   0.22%     3.7MB / 2.59MB    0B / 0B           14
73630399ba58   peerplays-full-network_peerplays-base_1          0.00%     2.305MiB / 31.14GiB   0.01%     19.3kB / 0B       8.19kB / 4.1kB    1
1f9c1a96b79d   peerplays-full-network_hive-for-peerplays_1      10.75%    13.38MiB / 31.14GiB   0.04%     15.8MB / 50.6MB   0B / 1.86MB       47
85349a682ca2   peerplays-full-network_bitcoin-for-peerplays_1   0.21%     117.6MiB / 31.14GiB   0.37%     312kB / 168kB     16.3MB / 59.3MB   25
4693127b7e4c   peerplays-full-network_ubuntu-for-peerplays_1    0.00%     2.887MiB / 31.14GiB   0.01%     65kB / 0B         3.2MB / 4.1kB     1
```