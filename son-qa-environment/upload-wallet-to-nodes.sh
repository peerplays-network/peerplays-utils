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

scp /var/opt/$1/wallet.json gladiator01:/var/opt/$1
scp /var/opt/$1/wallet.json gladiator02:/var/opt/$1
scp /var/opt/$1/wallet.json gladiator03:/var/opt/$1
scp /var/opt/$1/wallet.json gladiator04:/var/opt/$1
scp /var/opt/$1/wallet.json gladiator05:/var/opt/$1
scp /var/opt/$1/wallet.json gladiator06:/var/opt/$1
scp /var/opt/$1/wallet.json gladiator07:/var/opt/$1
scp /var/opt/$1/wallet.json gladiator08:/var/opt/$1
scp /var/opt/$1/wallet.json gladiator09:/var/opt/$1
scp /var/opt/$1/wallet.json gladiator10:/var/opt/$1
scp /var/opt/$1/wallet.json gladiator11:/var/opt/$1
scp /var/opt/$1/wallet.json gladiator12:/var/opt/$1
scp /var/opt/$1/wallet.json gladiator13:/var/opt/$1
scp /var/opt/$1/wallet.json gladiator14:/var/opt/$1
scp /var/opt/$1/wallet.json gladiator15:/var/opt/$1
scp /var/opt/$1/wallet.json gladiator16:/var/opt/$1
