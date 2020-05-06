#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Gitlab Job ID is not provided"
    exit
fi

if [ -z $1 ]
then
    echo "Job ID is empty string"
    exit
fi

CMD="cd /var/opt; tar -xf son-config-$1.tar.gz;"

scp son-config-$1.tar.gz gladiator01:/var/opt/
ssh -t gladiator01 $CMD;

scp son-config-$1.tar.gz gladiator02:/var/opt/
ssh -t gladiator02 $CMD;

scp son-config-$1.tar.gz gladiator03:/var/opt/
ssh -t gladiator03 $CMD;

scp son-config-$1.tar.gz gladiator04:/var/opt/
ssh -t gladiator04 $CMD;

scp son-config-$1.tar.gz gladiator05:/var/opt/
ssh -t gladiator05 $CMD;

scp son-config-$1.tar.gz gladiator06:/var/opt/
ssh -t gladiator06 $CMD;

scp son-config-$1.tar.gz gladiator07:/var/opt/
ssh -t gladiator07 $CMD;

scp son-config-$1.tar.gz gladiator08:/var/opt/
ssh -t gladiator08 $CMD;

scp son-config-$1.tar.gz gladiator09:/var/opt/
ssh -t gladiator09 $CMD;

scp son-config-$1.tar.gz gladiator10:/var/opt/
ssh -t gladiator10 $CMD;

scp son-config-$1.tar.gz gladiator11:/var/opt/
ssh -t gladiator11 $CMD;

scp son-config-$1.tar.gz gladiator12:/var/opt/
ssh -t gladiator12 $CMD;

scp son-config-$1.tar.gz gladiator13:/var/opt/
ssh -t gladiator13 $CMD;

scp son-config-$1.tar.gz gladiator14:/var/opt/
ssh -t gladiator14 $CMD;

scp son-config-$1.tar.gz gladiator15:/var/opt/
ssh -t gladiator15 $CMD;

scp son-config-$1.tar.gz gladiator16:/var/opt/
ssh -t gladiator16 $CMD;

