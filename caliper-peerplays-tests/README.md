# Hyperledger Caliper tests for Peerplays

## Initializing
To initialize test environment, run
```
npm i
```
Test environment uses packages from ../caliper-peerplays

## Running tests

Run basic-private-net tests.
This test is the same as Hyperledger Caliper integration test
```
BENCHMARK=basic-private-net ./run-tests.sh
```

Run develop-private-net tests.
```
BENCHMARK=develop-private-net ./run-tests.sh
```