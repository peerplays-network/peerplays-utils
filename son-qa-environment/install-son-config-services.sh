#!/bin/bash
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

if [ ! -d /var/opt/$1 ]
then
    echo "Directory for given Gitlab Job ID $1 does not exists. Upload and unpack setup package for this job first."
    exit
fi

CMD="cd /var/opt/$1; ./uninstall-service.sh; rm /var/opt/active 2> /dev/null;"

ssh -t gladiator01 $CMD;
ssh -t gladiator02 $CMD;
ssh -t gladiator03 $CMD;
ssh -t gladiator04 $CMD;
ssh -t gladiator05 $CMD;
ssh -t gladiator06 $CMD;
ssh -t gladiator07 $CMD;
ssh -t gladiator08 $CMD;
ssh -t gladiator09 $CMD;
ssh -t gladiator10 $CMD;
ssh -t gladiator11 $CMD;
ssh -t gladiator12 $CMD;
ssh -t gladiator13 $CMD;
ssh -t gladiator14 $CMD;
ssh -t gladiator15 $CMD;
ssh -t gladiator16 $CMD;

CMD="ln -s /var/opt/$1 /var/opt/active; cd /var/opt/active; ./install-service.sh; sudo service witness start;"

ssh -t gladiator01 $CMD;
ssh -t gladiator02 $CMD;
ssh -t gladiator03 $CMD;
ssh -t gladiator04 $CMD;
ssh -t gladiator05 $CMD;
ssh -t gladiator06 $CMD;
ssh -t gladiator07 $CMD;
ssh -t gladiator08 $CMD;
ssh -t gladiator09 $CMD;
ssh -t gladiator10 $CMD;
ssh -t gladiator11 $CMD;
ssh -t gladiator12 $CMD;
ssh -t gladiator13 $CMD;
ssh -t gladiator14 $CMD;
ssh -t gladiator15 $CMD;
ssh -t gladiator16 $CMD;

