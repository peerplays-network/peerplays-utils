#!/bin/bash

cd /home/peerplays/faucet
python3 -m venv env
. env/bin/activate
python3 manage.py install
python3 manage.py run

