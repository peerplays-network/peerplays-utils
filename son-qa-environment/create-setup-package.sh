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

PP_TOP=`pwd`
PP_OUT=$PP_TOP/$1

################################################################################
# Download executables
################################################################################

find $PP_OUT -maxdepth 1 -type f -delete
if [ ! -d $PP_OUT ]
then
    mkdir $PP_OUT
fi
cd $PP_OUT

DL_ADDR="https://gitlab.com/PBSA/peerplays/-/jobs/"$1"/artifacts/download"

echo "Downloaded from:" $DL_ADDR > README
cat README

wget --backups=1 --content-disposition --show-progress --timestamping $DL_ADDR
unzip -j artifacts.zip programs/cli_wallet/cli_wallet -d ./
unzip -j artifacts.zip programs/witness_node/witness_node -d ./
unzip -j artifacts.zip build/programs/cli_wallet/cli_wallet -d ./
unzip -j artifacts.zip build/programs/witness_node/witness_node -d ./
rm artifacts.zip

./witness_node --create-genesis-json ./genesis.json
sed -i 's/"initial_timestamp".*/"initial_timestamp": "2020-03-03T03:03:03",/' ./genesis.json
sed -i 's/"maintenance_interval".*/"maintenance_interval": 600,/' ./genesis.json
sed -i 's/"committee_proposal_review_period".*/"committee_proposal_review_period": 600,/' ./genesis.json
sed -i 's/"son_deregister_time".*/"son_deregister_time": 600,/' ./genesis.json
sed -i 's/"son_heartbeat_frequency".*/"son_heartbeat_frequency": 120,/' ./genesis.json
sed -i 's/"son_bitcoin_min_tx_confirmations".*/"son_bitcoin_min_tx_confirmations": 1/' ./genesis.json
cp ./witness_node_data_dir/config.ini ./
cp ./witness_node_data_dir/logging.ini ./
rm -rf ./witness_node_data_dir

#echo "#!/bin/bash
#    DL_ADDR=https://gitlab.com/PBSA/peerplays/-/jobs/"$1"/artifacts/download
#    echo "Download from:" \$DL_ADDR > README
#    cat README
#    wget --backups=1 --content-disposition --show-progress --timestamping \$DL_ADDR
#    unzip -j artifacts.zip programs/cli_wallet/cli_wallet -d ./
#    unzip -j artifacts.zip programs/witness_node/witness_node -d ./
#    rm artifacts.zip
#" > download.sh
#chmod 755 download.sh

################################################################################
# Fine tune config files
################################################################################

cd $PP_OUT

rm -rf son*

WITNESS_PRIVATE_KEY='private-key = ["TEST6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV", "5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3"]\
private-key = ["TEST5VEMezMNjQNs7jGsqrAYaf717KBxqgsJVW7crj1jyJD7f74WSz", "5JqoRu1TvX4am3TyW5fUreTjRzytw8FAT976VMMkuQPuJCqGjxV"]\
private-key = ["TEST8YgGjPfpnnK5rS1T21cd8CGtLxi8VvygpBCU2SvDZNBwkTApso", "5K8ZM2pQLuKqY8qRdqMZPc7hjUh9jGk4khhPuQksxCHefTZEUJ9"]\
private-key = ["TEST6bsLVw3PXzU5fpLbzc65zauPDr9Fr2Dam1ajJrg11rTtgd8kGv", "5JfJyJBWkkZ4DssQAHdEizQ3Zt1G9eRNNq1tMBqeVSMvhLz8rob"]\
private-key = ["TEST7gt2dGGm6BBpqJ1B9hzPk7swu5afnPR5p6nxt6EwRMYQfPE7y6", "5KSCJbACYNQS8qs3RLA66G9N3ibuhr34ykwsGKQLugfvF61eet5"]\
private-key = ["TEST7b71sb2eZyemoRLuD7r2kwhb3erxnm83U6VDiL7ArkJsDqTeZ1", "5JckfCEfu9hSj98YbEsoxMTZXEoaFoT38J6qrUtLWmPxLvunwuv"]\
private-key = ["TEST7cycUsXEdXubwwv7XuJ15n7y4sHzx22tjijiUVBRK7DxdBcdia", "5Km2Y9FQSDy9L9iTMJEqhhhmNJA3FqjcJKxaZ6vDa39xDN5zF4R"]\
private-key = ["TEST6VeyMca1RPYwFf4TUhxwph4u51R5RurVtCLPoT7YiXE5DU17e1", "5JNzVKW4T4EbFfPoF95b3USLSno8uvW4nohst7q5Fhz2s9Cg3BS"]\
private-key = ["TEST6mi9oujSjWQWwwa9Wh828wVRnsM3mAbgenMabUT8qcbDakDnbH", "5K5jdLK4jTvSgcJEffV1byH4tZqKtFeU4K3GiipzdsZRid7p8bh"]\
private-key = ["TEST5hwkj6FE6L3kgbyoGTbfVa2W1Dg4xjqBrnjGUHtBTyek6V4VxP", "5J4tVzBujte4D85UXUsTR3WW1jguCGPvA6h9bVjqDuwZCHBaJVN"]\
private-key = ["TEST67sAReBFozV5uMGqTeeiWHKLoS7h1QXT13UyuHHKYPBX72BqqZ", "5JxCgoaegFALUKFjC96iokTuiBFT5pC1DPQWNpXPiZRAbykb291"]\
private-key = ["TEST5Jnq9LjreRbeMVZrx63h71R1pEL8tr7QiNHykH8qpFRh4y6ZCW", "5JnKFuvgkV3BSRdJy8gU44HgtoaS4MUUFTn1XeSSBLDLoh8ZKkj"]\
private-key = ["TEST8AVAG4xdaQLi84wjibu2Zw7678gDEBPgZGYitBstLrtNHVBqzL", "5KEFACedMAqxHZyE57i7TzbW1G6hpFUz2HwfTVSmGcNEMG3jeB8"]\
private-key = ["TEST73Zi6sUtZrwNwNcmDjzLvgKVkpYwCnNaGeBiN5kbnBfUxZWHpZ", "5KYMakNUffD4NtV6xgQBpNvXGnxM79qAz4GRe1Ui2kuL9Le4VJh"]\
private-key = ["TEST51a97eZtRv4Ekq1qZXaXfnQbZ1G3hmh9yva1NJTCdWNYrx3p24", "5K596QZaXA1UndvSBbFDy1FCwpNyDv1cPex7kQ2LHqK7BUJctuu"]\
private-key = ["TEST6wbXLfEMkKY4aD9sqk3jNHo5wkxTQYgGHTfHVDUJCEQxWsfGDD", "5KYLDwEvhD8QguciGuKzJ83DjMBNWQLYqkHTdxSjKqSQNLyRevc"]\
private-key = ["TEST6HJpTxUzUePcRo2rLDjZwKpdBDWeHLXcYGSK9QVDPAn6yjXJBG", "5J3TrZJSJn1X1rpdN73L4q3kBBdZajgCRyL5mx6mYzn87RSLRwc"]'

PEERPLAYS_PRIVATE_KEY='peerplays-private-key = ["TEST8TCQFzyYDp3DPgWZ24261fMPSCzXxVyoF3miWeTj6JTi2DZdrL", "5K7tjTnFn2zasimVmebUiH1yawgwK9YXm2chUwcurcHgqms9JaF"]\
peerplays-private-key = ["TEST82qv1LKFvwVKD9pg5JQf6qqwLcoeqUniQjWJ3wKTodyWa7gHUs", "5JRquoT4gUGN3uubduPHs4DBXm9rAkK4v9XiFSsC3W9auiLmfCw"]\
peerplays-private-key = ["TEST6xdp7MrEPnaNK9GuF3KTeTizgGN6JC5nPmxx81higFepSZ8N7r", "5JA2FTEYR8chN4yyjuvjPVj8rLBsenF2hCHJiCvsbqVT3f1rK3y"]\
peerplays-private-key = ["TEST55j32Up75gHCxJBPN18vEytL9anDgEVFtsaCii38keGQG71X22", "5KKPsfzeDkLsF9pY4k24RTbMwzboGdBeL5xVEV7KAA1KTkRmvLJ"]\
peerplays-private-key = ["TEST68bX5bB16GkEAig6w2WTh9NbM9nHa66CemnDRx2njRY9bbWXhU", "5KfCbyBSM9THppP6rziPP5tob5josREyLUQ5a3eapxSroYgwoQW"]\
peerplays-private-key = ["TEST7mtTyM2rD18xDTtLTxWhq6W6zFgAgPFu9KHSFNsfWJXZNT8Wc8", "5KG5VDSLDufHNnQmntDerqyZiJc2KSs7cdJwNHazUHTFBCo55z5"]\
peerplays-private-key = ["TEST7RMDnipLkFaQ4vtDyVvgyCedRoxyT9JWpAoM9mrE7rwVSyezoB", "5Ke4rE7et3M3u7W56oC7GgVcg4gHfSRmhBrUDbEMynRonBNccts"]\
peerplays-private-key = ["TEST51nSJ2q1C9htnYWfTv73JxEc4nBWPNxJtUGPGpD4XwxeLzAd8t", "5Khgi1sfBVdrTW9AHxWFAneiWaU3bYH4e735EfE57159avREuwg"]\
peerplays-private-key = ["TEST8EmMMvQdAPzcnxymRUpbYdg8fArUY473QosCQpuPtWXxXtoNp4", "5JQg9dkzHrJGo83RdhnAa1qbQp5qV36CRQibnfJrHfhGenhfgsJ"]\
peerplays-private-key = ["TEST5815xbKy73Bx1LJWW1jg7GshWSEFWub3uoiEFP7FtP6z4YZtkU", "5KHL95xtsCfDjPFWxYPBrtwDyMefZEcpvoY7NnSm2cg5myNhfyf"]\
peerplays-private-key = ["TEST61qgG2v6JArygFiQCKypymxhBqg1wKmmbdkHeNkXhYDvkZmBtY", "5Hw1GisKTx5hYddiTXaWcdvd5eWDGWrKEKuJW8WyCmEb4Xge1S9"]\
peerplays-private-key = ["TEST6z33kHxQxyGvFWfpAnL3X3MvLtPEBknkNeFFJyk63PvRtaN1Xo", "5KhRjXEPMSRcYq7WP1hEyED9kRXnXS8cUX9Gtr8iC5eeGWfuUEx"]\
peerplays-private-key = ["TEST55eCWenoKmZct5YvUYv7aphMmSVkroZTJZWFHGTVj8r8bKEPMd", "5JDfNgNseqtpLNiNbr3GH4JawUnHgZuKv4sVQ6ogZj8veWzugZL"]\
peerplays-private-key = ["TEST5e4HXhA4yBEGzaXVyjuVabKhG1qGghi6rypvq5fLxAmU9XLRHT", "5JWx5uWUgbabd8HJSo1VwFnejCBLEimccKp874kr6VaXWgRu9Mk"]\
peerplays-private-key = ["TEST89qMuZejYeeGvjr3bMEcGyvhD4dyUchmxbLNUBFbPodqJKJPZc", "5JBDoxqXDE5ZqKTq9C2gMSo5tdcFakV9PUmp8AExjiJqvKgvXn2"]\
peerplays-private-key = ["TEST6KRpHxYJSE5vXvoeVMLbKSYnVspt2nnGV2enncRzHgLQ9dez5v", "5J8VEW8BvZBYRRTtf5p3yCyq7K9T5DBe1dadtmvmzqxvgPAk2Nr"]'

BITCOIN_PRIVATE_KEY='bitcoin-private-key = ["03456772301e221026269d3095ab5cb623fc239835b583ae4632f99a15107ef275", "cSKyTeXidmj93dgbMFqgzD7yvxzA7QAYr5j9qDnY9seyhyv7gH2m"]\
bitcoin-private-key = ["02d67c26cf20153fe7625ca1454222d3b3aeb53b122d8a0f7d32a3dd4b2c2016f4", "cQBBNyEw6P3pgc2NjPpKR2YoCpio9s3qEMkFkY7v9hByLAxeLQ3s"]\
bitcoin-private-key = ["025f7cfda933516fd590c5a34ad4a68e3143b6f4155a64b3aab2c55fb851150f61", "cQLKc4UgKyCdXY3PosndszEZTsB6mTrg4avZF6kDphrULKd2W6L4"]\
bitcoin-private-key = ["0228155bb1ddcd11c7f14a2752565178023aa963f84ea6b6a052bddebad6fe9866", "cN43k9sqQimgzChZm9Qz1V1bdkjVwB3mcSHsEuj6bfUa4SP2AsTk"]\
bitcoin-private-key = ["037500441cfb4484da377073459511823b344f1ef0d46bac1efd4c7c466746f666", "cNBmovk8MnGmQBs7scJ3p1fRftdV1EyXMuUsX5DfmWg7wtmUMFBe"]\
bitcoin-private-key = ["02ef0d79bfdb99ab0be674b1d5d06c24debd74bffdc28d466633d6668cc281cccf", "cPQNr8RFGHEZVv6GoTPSTca24vZXzvQSJTUzuwArLzxXdhh7TY3H"]\
bitcoin-private-key = ["0317941e4219548682fb8d8e172f0a8ce4d83ce21272435c85d598558c8e060b7f", "cRNwxg1aozGvACsVWFE7xGtUBq7Fw4it2GQGBb2XLvaVidoCZim4"]\
bitcoin-private-key = ["0266065b27f7e3d3ad45b471b1cd4e02de73fc4737dc2679915a45e293c5adcf84", "cPmakGTVWfsXsT8gSPZp9bcMkUAjSQYgwUtHKqn7cvTjv9vZvBix"]\
bitcoin-private-key = ["023821cc3da7be9e8cdceb8f146e9ddd78a9519875ecc5b42fe645af690544bccf", "cSafFKRU6YFxS56jcAfdrKoLYvfnwHEdvJ3LzvjJciMGz3dsktpV"]\
bitcoin-private-key = ["0229ff2b2106b76c27c393e82d71c20eec32bcf1f0cf1a9aca8a237269a67ff3e5", "cSDxZhz4ceyBLcbQwEHWU7G4ER7zZ1YkvkWf28MgyEkLznmU4YGh"]\
bitcoin-private-key = ["024d113381cc09deb8a6da62e0470644d1a06de82be2725b5052668c8845a4a8da", "cPPiiVPx1C2upFNUFBkJejqC23UdqFHQd997jJxPz5Y3Hsd22LWu"]\
bitcoin-private-key = ["03df2462a5a2f681a3896f61964a65566ff77448be9a55a6da18506fd9c6c051c1", "cRLAbigw6N7TyooJn4j4egoKmdmrJYFEQtsWbYsWMCfZBn6AZLF2"]\
bitcoin-private-key = ["02bafba3096f546cc5831ce1e49ba7142478a659f2d689bbc70ed37235255172a8", "cVn2ARgPNeCpiNjAJK863DntnmftoAKjUF9Zqsnuuo3Ybv5Y5XrQ"]\
bitcoin-private-key = ["0287bcbd4f5d357f89a86979b386402445d7e9a5dccfd16146d1d2ab0dc2c32ae8", "cNgGKKPAxDXD8SBronD1MSX8df17jTBvcSD1uugepFgstUbRvpy4"]\
bitcoin-private-key = ["02053859d76aa375d6f343a60e3678e906c008015e32fe4712b1fd2b26473bdd73", "cUjR52VietRnVCmY56TEVRgkkst7RzjZqDoJqkL3tNrs1NkrgjU6"]\
bitcoin-private-key = ["03c880baffd37471f3c7e712e51b339dd08e2056757fc8499ea3d41d4fa1801247", "cVkEokoui82vfPtEWS8pKhLZiWHKbFvdXxsKDen32Uz71zpqLZfc"]'



mkdir son01
cd son01
mkdir witness_node_data_dir

cp ../config.ini ./witness_node_data_dir/
cp ../logging.ini ./witness_node_data_dir/
ln -s ../genesis.json


sed -i 's/.*p2p-endpoint.*/p2p-endpoint = 0.0.0.0:9777/' ./witness_node_data_dir/config.ini
sed -i 's/.*seed-node[^s].*/\# seed-node = /' ./witness_node_data_dir/config.ini
sed -i 's/.*seed-nodes.*/seed-nodes = \["96.46.49.1:9777", "96.46.49.5:9777", "96.46.49.9:9777", "96.46.49.13:9777"\]/' ./witness_node_data_dir/config.ini
sed -i 's/.*rpc-endpoint.*/rpc-endpoint = 0.0.0.0:8090/' ./witness_node_data_dir/config.ini
sed -i 's/.*genesis-json.*/genesis-json = genesis.json/' ./witness_node_data_dir/config.ini

sed -i 's/[^#] peerplays_sidechain//' ./witness_node_data_dir/config.ini
sed -i '/^plugins/ s/$/ peerplays_sidechain/' ./witness_node_data_dir/config.ini

sed -i 's/.*enable-stale-production.*/enable-stale-production = true/' ./witness_node_data_dir/config.ini
sed -i 's/.*witness-id[^s].*/# witness-id = "1.6.1"/' ./witness_node_data_dir/config.ini
sed -i 's/.*witness-ids.*/witness-ids = \["1.6.1", "1.6.12"\]/' ./witness_node_data_dir/config.ini
sed -i 's/^private-key.*$/'"$WITNESS_PRIVATE_KEY"'/' ./witness_node_data_dir/config.ini

sed -i 's/.*son-id[^s].*/son-id = "1.27.0"/' ./witness_node_data_dir/config.ini
sed -i 's/.*peerplays-private-key.*/'"$PEERPLAYS_PRIVATE_KEY"'/' ./witness_node_data_dir/config.ini
sed -i 's/.*bitcoin-node-ip.*/bitcoin-node-ip = 127.0.0.1/' ./witness_node_data_dir/config.ini
sed -i 's/.*bitcoin-node-zmq-port.*/bitcoin-node-zmq-port = 11111/' ./witness_node_data_dir/config.ini
sed -i 's/.*bitcoin-node-rpc-port.*/bitcoin-node-rpc-port = 8332/' ./witness_node_data_dir/config.ini
sed -i 's/.*bitcoin-node-rpc-user.*/bitcoin-node-rpc-user = 1/' ./witness_node_data_dir/config.ini
sed -i 's/.*bitcoin-node-rpc-password.*/bitcoin-node-rpc-password = 1/' ./witness_node_data_dir/config.ini
sed -i 's/.*bitcoin-wallet[^-].*/bitcoin-wallet = son-wallet/' ./witness_node_data_dir/config.ini
sed -i 's/.*bitcoin-wallet-password.*/bitcoin-wallet-password = 9da115c9fa6fe7fd09390841ac91aee4/' ./witness_node_data_dir/config.ini
sed -i 's/.*bitcoin-private-key.*/'"$BITCOIN_PRIVATE_KEY"'/' ./witness_node_data_dir/config.ini

echo '[Unit]
Description=Witness
After=network.target

[Service]
ExecStart=/var/opt/'"$1"'/witness_node --replay-blockchain
Restart=always
RestartSec=5
#StandardError=file:/var/opt/'"$1"'/son01/StdErr.log
#StandardOutput=file:/var/opt/'"$1"'/son01/StdOut.log
User=gladiator
WorkingDirectory=/var/opt/'"$1"'/son01

[Install]
WantedBy=multi-user.target' > witness.service



cd $PP_OUT
cp -r ./son01 ./son02
cd son02

#sed -i 's/.*p2p-endpoint.*/p2p-endpoint = 0.0.0.0:9778/' ./witness_node_data_dir/config.ini
#sed -i 's/.*seed-nodes.*/seed-nodes = \[\"99.79.189.95:9777\"\]/' ./witness_node_data_dir/config.ini
#sed -i 's/.*rpc-endpoint.*/rpc-endpoint = 0.0.0.0:8091/' ./witness_node_data_dir/config.ini

sed -i 's/.*enable-stale-production.*/enable-stale-production = false/' ./witness_node_data_dir/config.ini
sed -i 's/.*witness-id[^s].*/# witness-id = "1.6.2"/' ./witness_node_data_dir/config.ini
sed -i 's/.*witness-ids.*/witness-ids = \["1.6.2", "1.6.13"\]/' ./witness_node_data_dir/config.ini

sed -i 's/.*son-id[^s].*/son-id = "1.27.1"/' ./witness_node_data_dir/config.ini

sed -i 's/son01/son02/' ./witness.service



cd $PP_OUT
cp -r ./son02 ./son03
cd son03

#sed -i 's/.*p2p-endpoint.*/p2p-endpoint = 0.0.0.0:9779/' ./witness_node_data_dir/config.ini
#sed -i 's/.*rpc-endpoint.*/rpc-endpoint = 0.0.0.0:8092/' ./witness_node_data_dir/config.ini

sed -i 's/.*witness-id[^s].*/# witness-id = "1.6.3"/' ./witness_node_data_dir/config.ini
sed -i 's/.*witness-ids.*/witness-ids = \["1.6.3", "1.6.14"\]/' ./witness_node_data_dir/config.ini

sed -i 's/.*son-id[^s].*/son-id = "1.27.2"/' ./witness_node_data_dir/config.ini

sed -i 's/son02/son03/' ./witness.service



cd $PP_OUT
cp -r ./son02 ./son04
cd son04

#sed -i 's/.*p2p-endpoint.*/p2p-endpoint = 0.0.0.0:9780/' ./witness_node_data_dir/config.ini
#sed -i 's/.*rpc-endpoint.*/rpc-endpoint = 0.0.0.0:8093/' ./witness_node_data_dir/config.ini

sed -i 's/.*witness-id[^s].*/# witness-id = "1.6.4"/' ./witness_node_data_dir/config.ini
sed -i 's/.*witness-ids.*/witness-ids = \["1.6.4", "1.6.15"\]/' ./witness_node_data_dir/config.ini

sed -i 's/.*son-id[^s].*/son-id = "1.27.3"/' ./witness_node_data_dir/config.ini

sed -i 's/son02/son04/' ./witness.service



cd $PP_OUT
cp -r ./son02 ./son05
cd son05

#sed -i 's/.*p2p-endpoint.*/p2p-endpoint = 0.0.0.0:9781/' ./witness_node_data_dir/config.ini
#sed -i 's/.*rpc-endpoint.*/rpc-endpoint = 0.0.0.0:8094/' ./witness_node_data_dir/config.ini

sed -i 's/.*witness-id[^s].*/# witness-id = "1.6.5"/' ./witness_node_data_dir/config.ini
sed -i 's/.*witness-ids.*/witness-ids = \["1.6.5", "1.6.16"\]/' ./witness_node_data_dir/config.ini

sed -i 's/.*son-id[^s].*/son-id = "1.27.4"/' ./witness_node_data_dir/config.ini

sed -i 's/son02/son05/' ./witness.service



cd $PP_OUT
cp -r ./son02 ./son06
cd son06

#sed -i 's/.*p2p-endpoint.*/p2p-endpoint = 0.0.0.0:9782/' ./witness_node_data_dir/config.ini
#sed -i 's/.*rpc-endpoint.*/rpc-endpoint = 0.0.0.0:8095/' ./witness_node_data_dir/config.ini

sed -i 's/.*witness-id[^s].*/# witness-id = "1.6.6"/' ./witness_node_data_dir/config.ini
sed -i 's/.*witness-ids.*/witness-ids = \["1.6.6", "1.6.17"\]/' ./witness_node_data_dir/config.ini

sed -i 's/.*son-id[^s].*/son-id = "1.27.5"/' ./witness_node_data_dir/config.ini

sed -i 's/son02/son06/' ./witness.service



cd $PP_OUT
cp -r ./son02 ./son07
cd son07

#sed -i 's/.*p2p-endpoint.*/p2p-endpoint = 0.0.0.0:9783/' ./witness_node_data_dir/config.ini
#sed -i 's/.*rpc-endpoint.*/rpc-endpoint = 0.0.0.0:8096/' ./witness_node_data_dir/config.ini

sed -i 's/.*witness-id[^s].*/# witness-id = "1.6.7"/' ./witness_node_data_dir/config.ini
sed -i 's/.*witness-ids.*/witness-ids = \["1.6.7", "1.6.18"\]/' ./witness_node_data_dir/config.ini

sed -i 's/.*son-id[^s].*/son-id = "1.27.6"/' ./witness_node_data_dir/config.ini

sed -i 's/son02/son07/' ./witness.service



cd $PP_OUT
cp -r ./son02 ./son08
cd son08

#sed -i 's/.*p2p-endpoint.*/p2p-endpoint = 0.0.0.0:9784/' ./witness_node_data_dir/config.ini
#sed -i 's/.*rpc-endpoint.*/rpc-endpoint = 0.0.0.0:8097/' ./witness_node_data_dir/config.ini

sed -i 's/.*witness-id[^s].*/# witness-id = "1.6.8"/' ./witness_node_data_dir/config.ini
sed -i 's/.*witness-ids.*/witness-ids = \["1.6.8", "1.6.19"\]/' ./witness_node_data_dir/config.ini

sed -i 's/.*son-id[^s].*/son-id = "1.27.7"/' ./witness_node_data_dir/config.ini

sed -i 's/son02/son08/' ./witness.service



cd $PP_OUT
cp -r ./son02 ./son09
cd son09

#sed -i 's/.*p2p-endpoint.*/p2p-endpoint = 0.0.0.0:9785/' ./witness_node_data_dir/config.ini
#sed -i 's/.*rpc-endpoint.*/rpc-endpoint = 0.0.0.0:8098/' ./witness_node_data_dir/config.ini

sed -i 's/.*witness-id[^s].*/# witness-id = "1.6.9"/' ./witness_node_data_dir/config.ini
sed -i 's/.*witness-ids.*/witness-ids = \["1.6.9", "1.6.20"\]/' ./witness_node_data_dir/config.ini

sed -i 's/.*son-id[^s].*/son-id = "1.27.8"/' ./witness_node_data_dir/config.ini

sed -i 's/son02/son09/' ./witness.service



cd $PP_OUT
cp -r ./son02 ./son10
cd son10

#sed -i 's/.*p2p-endpoint.*/p2p-endpoint = 0.0.0.0:9786/' ./witness_node_data_dir/config.ini
#sed -i 's/.*rpc-endpoint.*/rpc-endpoint = 0.0.0.0:8099/' ./witness_node_data_dir/config.ini

sed -i 's/.*witness-id[^s].*/# witness-id = "1.6.10"/' ./witness_node_data_dir/config.ini
sed -i 's/.*witness-ids.*/witness-ids = \["1.6.10", "1.6.21"\]/' ./witness_node_data_dir/config.ini

sed -i 's/.*son-id[^s].*/son-id = "1.27.9"/' ./witness_node_data_dir/config.ini

sed -i 's/son02/son10/' ./witness.service



cd $PP_OUT
cp -r ./son02 ./son11
cd son11

#sed -i 's/.*p2p-endpoint.*/p2p-endpoint = 0.0.0.0:9787/' ./witness_node_data_dir/config.ini
#sed -i 's/.*rpc-endpoint.*/rpc-endpoint = 0.0.0.0:8100/' ./witness_node_data_dir/config.ini

sed -i 's/.*witness-id[^s].*/# witness-id = "1.6.11"/' ./witness_node_data_dir/config.ini
sed -i 's/.*witness-ids.*/witness-ids = \["1.6.11", "1.6.22"\]/' ./witness_node_data_dir/config.ini

sed -i 's/.*son-id[^s].*/son-id = "1.27.10"/' ./witness_node_data_dir/config.ini

sed -i 's/son02/son11/' ./witness.service



cd $PP_OUT
cp -r ./son02 ./son12
cd son12

#sed -i 's/.*p2p-endpoint.*/p2p-endpoint = 0.0.0.0:9788/' ./witness_node_data_dir/config.ini
#sed -i 's/.*rpc-endpoint.*/rpc-endpoint = 0.0.0.0:8101/' ./witness_node_data_dir/config.ini

sed -i 's/.*witness-id[^s].*/# witness-id = /' ./witness_node_data_dir/config.ini
sed -i 's/.*witness-ids.*/witness-ids = \["1.6.23"\]/' ./witness_node_data_dir/config.ini

sed -i 's/.*son-id[^s].*/son-id = "1.27.11"/' ./witness_node_data_dir/config.ini

sed -i 's/son02/son12/' ./witness.service



cd $PP_OUT
cp -r ./son02 ./son13
cd son13

#sed -i 's/.*p2p-endpoint.*/p2p-endpoint = 0.0.0.0:9789/' ./witness_node_data_dir/config.ini
#sed -i 's/.*rpc-endpoint.*/rpc-endpoint = 0.0.0.0:8102/' ./witness_node_data_dir/config.ini

sed -i 's/.*witness-id[^s].*/# witness-id = /' ./witness_node_data_dir/config.ini
sed -i 's/.*witness-ids.*/witness-ids = \["1.6.24"\]/' ./witness_node_data_dir/config.ini

sed -i 's/.*son-id[^s].*/son-id = "1.27.12"/' ./witness_node_data_dir/config.ini

sed -i 's/son02/son13/' ./witness.service



cd $PP_OUT
cp -r ./son02 ./son14
cd son14

#sed -i 's/.*p2p-endpoint.*/p2p-endpoint = 0.0.0.0:9790/' ./witness_node_data_dir/config.ini
#sed -i 's/.*rpc-endpoint.*/rpc-endpoint = 0.0.0.0:8103/' ./witness_node_data_dir/config.ini

sed -i 's/.*witness-id[^s].*/# witness-id = /' ./witness_node_data_dir/config.ini
sed -i 's/.*witness-ids.*/witness-ids = \["1.6.25"\]/' ./witness_node_data_dir/config.ini

sed -i 's/.*son-id[^s].*/son-id = "1.27.13"/' ./witness_node_data_dir/config.ini

sed -i 's/son02/son14/' ./witness.service



cd $PP_OUT
cp -r ./son02 ./son15
cd son15

#sed -i 's/.*p2p-endpoint.*/p2p-endpoint = 0.0.0.0:9791/' ./witness_node_data_dir/config.ini
#sed -i 's/.*rpc-endpoint.*/rpc-endpoint = 0.0.0.0:8104/' ./witness_node_data_dir/config.ini

sed -i 's/.*witness-id[^s].*/# witness-id = /' ./witness_node_data_dir/config.ini
sed -i 's/.*witness-ids.*/witness-ids = \["1.6.26"\]/' ./witness_node_data_dir/config.ini

sed -i 's/.*son-id[^s].*/son-id = "1.27.14"/' ./witness_node_data_dir/config.ini

sed -i 's/son02/son15/' ./witness.service



cd $PP_OUT
cp -r ./son02 ./son16
cd son16

#sed -i 's/.*p2p-endpoint.*/p2p-endpoint = 0.0.0.0:9792/' ./witness_node_data_dir/config.ini
#sed -i 's/.*rpc-endpoint.*/rpc-endpoint = 0.0.0.0:8105/' ./witness_node_data_dir/config.ini

sed -i 's/.*witness-id[^s].*/# witness-id = /' ./witness_node_data_dir/config.ini
sed -i 's/.*witness-ids.*/witness-ids = \["1.6.27"\]/' ./witness_node_data_dir/config.ini

sed -i 's/.*son-id[^s].*/son-id = "1.27.15"/' ./witness_node_data_dir/config.ini

sed -i 's/son02/son16/' ./witness.service

################################################################################
# Prepare helper scripts
################################################################################

cd $PP_OUT

echo "#!/bin/bash
    SON_ID=\`ifconfig | grep 96.46.49 | awk '{ split(\$2, a, \".\"); printf(\"%.2d\", a[4]); }'\`
    echo "Installing service for SON \$SON_ID"
    sudo rm /etc/systemd/system/witness.service 2> /dev/null
    sudo ln -s /var/opt/$1/son\$SON_ID/witness.service /etc/systemd/system/witness.service
    sudo systemctl enable witness
    ls -al /etc/systemd/system/witness.service
    sudo systemctl daemon-reload
    ln -s /var/opt/$1/son\$SON_ID /var/opt/$1/active
    echo "Done"
" > install-service.sh

echo "#!/bin/bash
    SON_ID=\`ifconfig | grep 96.46.49 | awk '{ split(\$2, a, \".\"); printf(\"%.2d\", a[4]); }'\`
    echo "Uninstalling service for SON \$SON_ID"
    sudo systemctl stop witness
    sudo systemctl disable witness
    sudo rm /etc/systemd/system/witness.service 2> /dev/null
    sudo systemctl daemon-reload
    sudo systemctl reset-failed
    rm /var/opt/$1/active
    echo "Done"
" > uninstall-service.sh

echo "#!/bin/bash
    SON_ID=\`ifconfig | grep 96.46.49 | awk '{ split(\$2, a, \".\"); printf(\"%.2d\", a[4]); }'\`
    echo "Deleting database for SON \$SON_ID"
    rm -rf /var/opt/$1/son\$SON_ID/witness_node_data_dir/blockchain
    rm -rf /var/opt/$1/son\$SON_ID/witness_node_data_dir/logs
    rm -rf /var/opt/$1/son\$SON_ID/witness_node_data_dir/p2p
    rm -rf /var/opt/$1/after*
    rm -rf /var/opt/$1/before*
    rm -rf /var/opt/$1/wallet.json
    echo "Done"
" > delete-database.sh

find -iname "*.sh" | sort | xargs chmod 755

find -iname "*.ini" | sort | xargs chmod 644
find -iname "genesis.json" | sort | xargs chmod 644
find -iname "*.service" | sort | xargs chmod 644

cd $PP_TOP
#tar --exclude="*/README" --exclude="*/cli_wallet" --exclude="*/witness_node" -zcvf $PP_TOP/son-config-$1.tar.gz $1
tar -zcvf $PP_TOP/son-config-$1.tar.gz $1

echo "================================================================================"
echo "Setup package created!"
echo "- Copy son-config-$1.tar.gz to all 16 nodes"
echo "- Unpack son-config-$1.tar.gz in /var/opt/"
echo "- Executables and configuration files will be located in /var/opt/$1"
echo "- Run install-service.sh to install witness service"
echo "- Run uninstall-service.sh to uninstall witness service"
echo "- Run delete-database.sh to delete blockchain database"

