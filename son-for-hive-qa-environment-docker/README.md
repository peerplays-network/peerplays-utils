# SON for Hive QA environment

This docker image contains self contained, ready to go, SON for Hive QA environment

## Build the docker image
Building the image will take some time, as the software will be built from scratch.
```
docker build -t son-for-hive .
```

## Start the docker container
We'll map port 2000 on local machine to the port 22 on docker container
```
docker run -p 0.0.0.0:2000:22 son-for-hive:latest
```

## Stop the docker container
```
# Get the list of running containers
docker container ps

# Find the name of your contaier, look for one running son-for-hive:latest image
CONTAINER ID        IMAGE                 COMMAND                  CREATED             STATUS              PORTS                                                       NAMES
0faae7d0060f        son-for-hive:latest   "/usr/sbin/sshd -D"      53 minutes ago      Up 53 minutes       8090/tcp, 9777/tcp, 28090-28091/tcp, 0.0.0.0:2000->22/tcp   hungry_hugle

# Name is hungry_hungle
docker stop hungry_hugle
```

## Connect to the container by SSH
```
# User: peerplays
# Pass: peerplays

ssh peerplays@127.0.0.1 -p 2000
```

## Image content, /home/peerplays
```
hive-network           - Hive software, data dir, configuration and network init script
peerplays-network      - Peerplays software, data dir, configuration and network init script
src                    - Peerplays source code
```

## Starting up the QA env
Docker container runs just the SSH daemon. In order to start the environment, you have to connect to the container and start the software manually.
This will give you access to the software output, needed for QA testing.

The image does not use volumes, so no data is preserved between restarts. If the container is stopped, all blockchain data will be discarded.

You will need at least 4 connections to the docker container.

### Step 1: Start Hive node
```
ssh peerplays@127.0.0.1 -p 2000

cd hive-network
./hived -d ./hived_data_dir

# Wait to see "Generated block #..." messages
```

### Step 2: Initialize Hive network and start the Hive wallet
Step 1 has to be executed first.
```
ssh peerplays@127.0.0.1 -p 2000

cd hive-network

# Make sure "Generated block #..." messages are popping up in Step 1 output. Do not execute before they do.
# Execution will take some time, as Hive cli wallet executes single command per block

./init-network.ch

./cli_wallet -s ws://127.0.0.1:28090 -r 127.0.0.1:28091

# Unlock wallet with 'unlock password'
```

### Step 3: Start Peerplays node
Step 2 has to be successfully completed first.
```
ssh peerplays@127.0.0.1 -p 2000

cd peerplays-network
./witness_node

# Make sure to pick up the chain id
```

### Step 4: Initialize Peerplays network and start the Peerplays wallet
Step 3 has to be executed first.
```
ssh peerplays@127.0.0.1 -p 2000

cd peerplays-network

# Make sure "Generated block #..." messages are popping up in Step 3 output. Do not execute before they do.
# Make sure to execute at least 3 minutes before maintenance period (each 10 minutes), and 40 seconds after maintenance block.
# Eg do not execute from 01:07:00 to 01:10:40. This might help you in getting cleaner environment.
# You got the CHAIN_ID in previous step

./init-network CHAIN_ID

./cli_wallet

# Unlock wallet with 'unlock password'

# Wait for the maintenance period
```

## Testing

### Make payment to son-account on hive
```
# @ Hive cli wallet
# Execute the following commands

# Checkout son-account properties
get_account son-account

## Output will be similar to this
{
  "id": 6,
  "name": "son-account",
  "owner": {
    "weight_threshold": 1,
    "account_auths": [],
    "key_auths": [[
        "TST8kLKo9seYaJvuQSdwFd2YAi29VRdCVeLgd3E8A7PUFaKosYRGL",
        1
      ]
    ]
  },
  "active": {
    "weight_threshold": 11,
    "account_auths": [[
        "sonaccount01",
        1
      ],[
        "sonaccount02",
        1
      ],[
        "sonaccount03",
        1
      ],[
        "sonaccount04",
        1
      ],[
        "sonaccount05",
        1
      ],[
        "sonaccount06",
        1
      ],[
        "sonaccount07",
        1
      ],[
        "sonaccount08",
        1
      ],[
        "sonaccount09",
        1
      ],[
        "sonaccount10",
        1
      ],[
        "sonaccount11",
        1
      ],[
        "sonaccount12",
        1
      ],[
        "sonaccount13",
        1
      ],[
        "sonaccount14",
        1
      ],[
        "sonaccount15",
        1
      ]
    ],
    "key_auths": []
  },
  ...
}
## Output end

# Make the transfers to the son-account
transfer account05 son-account "1000.000 TBD" null true
transfer account05 son-account "1000.000 TESTS" null true

# @ Peerplays witness
# Checkout the the payment detection
...
3171299ms th_a       sidechain_net_handler.cpp:148 sidechain_event_data ] sidechain_event_data:
3171299ms th_a       sidechain_net_handler.cpp:149 sidechain_event_data ]   timestamp:                2021-04-19T12:52:51
3171299ms th_a       sidechain_net_handler.cpp:150 sidechain_event_data ]   block_num:                341
3171299ms th_a       sidechain_net_handler.cpp:151 sidechain_event_data ]   sidechain:                hive
3171299ms th_a       sidechain_net_handler.cpp:152 sidechain_event_data ]   sidechain_uid:            hive-68e350b8c81994315b73fd1edc648c1978084416-0
3171299ms th_a       sidechain_net_handler.cpp:153 sidechain_event_data ]   sidechain_transaction_id: 68e350b8c81994315b73fd1edc648c1978084416
3171299ms th_a       sidechain_net_handler.cpp:154 sidechain_event_data ]   sidechain_from:           account05
3171300ms th_a       sidechain_net_handler.cpp:155 sidechain_event_data ]   sidechain_to:             son-account
3171300ms th_a       sidechain_net_handler.cpp:156 sidechain_event_data ]   sidechain_currency:       HBD
3171300ms th_a       sidechain_net_handler.cpp:157 sidechain_event_data ]   sidechain_amount:         1000000
3171300ms th_a       sidechain_net_handler.cpp:158 sidechain_event_data ]   peerplays_from:           1.2.56
3171300ms th_a       sidechain_net_handler.cpp:159 sidechain_event_data ]   peerplays_to:             1.2.19
3171300ms th_a       sidechain_net_handler.cpp:160 sidechain_event_data ]   peerplays_asset:          {"amount":40000000,"asset_id":"1.3.0"}
...
3177301ms th_a       sidechain_net_handler.cpp:148 sidechain_event_data ] sidechain_event_data:
3177301ms th_a       sidechain_net_handler.cpp:149 sidechain_event_data ]   timestamp:                2021-04-19T12:52:57
3177301ms th_a       sidechain_net_handler.cpp:150 sidechain_event_data ]   block_num:                343
3177301ms th_a       sidechain_net_handler.cpp:151 sidechain_event_data ]   sidechain:                hive
3177301ms th_a       sidechain_net_handler.cpp:152 sidechain_event_data ]   sidechain_uid:            hive-e5f5504bbffa1d3f8a6eb32214de4fa7b7db52d1-0
3177301ms th_a       sidechain_net_handler.cpp:153 sidechain_event_data ]   sidechain_transaction_id: e5f5504bbffa1d3f8a6eb32214de4fa7b7db52d1
3177301ms th_a       sidechain_net_handler.cpp:154 sidechain_event_data ]   sidechain_from:           account05
3177301ms th_a       sidechain_net_handler.cpp:155 sidechain_event_data ]   sidechain_to:             son-account
3177301ms th_a       sidechain_net_handler.cpp:156 sidechain_event_data ]   sidechain_currency:       HIVE
3177301ms th_a       sidechain_net_handler.cpp:157 sidechain_event_data ]   sidechain_amount:         1000000
3177301ms th_a       sidechain_net_handler.cpp:158 sidechain_event_data ]   peerplays_from:           1.2.56
3177301ms th_a       sidechain_net_handler.cpp:159 sidechain_event_data ]   peerplays_to:             1.2.19
3177301ms th_a       sidechain_net_handler.cpp:160 sidechain_event_data ]   peerplays_asset:          {"amount":40000000,"asset_id":"1.3.0"}

# @ Peerplays cli_wallet
# Checkout the the account05 balances

list_account_balances account05

## Output will be similar to this
50000000 TEST
1000 HBD
1000 HIVE
1000000 PBTC
1000000 PEOS
1000000 PETH
## Output end
```









































