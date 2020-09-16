#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FROM datasecuritynode/peerplays:develop

RUN /usr/local/bin/witness_node --create-genesis-json /peerplays/genesis.json --data-dir=/peerplays/witness_node_data_dir && \
    sed -i 's/"initial_timestamp".*/"initial_timestamp": "2020-03-03T03:03:03",/' /peerplays/genesis.json && \
    sed -i 's/"maintenance_interval".*/"maintenance_interval": 600,/' /peerplays/genesis.json && \
    sed -i 's/"committee_proposal_review_period".*/"committee_proposal_review_period": 600,/' /peerplays/genesis.json && \
    sed -i 's/"son_deregister_time".*/"son_deregister_time": 600,/' /peerplays/genesis.json && \
    sed -i 's/"son_heartbeat_frequency".*/"son_heartbeat_frequency": 120,/' /peerplays/genesis.json && \
    sed -i 's/"son_bitcoin_min_tx_confirmations".*/"son_bitcoin_min_tx_confirmations": 1/' /peerplays/genesis.json && \
    sed -i 's/.*p2p-endpoint.*/p2p-endpoint = 0.0.0.0:9777/' /peerplays/witness_node_data_dir/config.ini && \
    sed -i 's/.*seed-node[^s].*/\# seed-node = /' /peerplays/witness_node_data_dir/config.ini && \
    sed -i 's/.*seed-nodes.*/seed-nodes = \[\]/' /peerplays/witness_node_data_dir/config.ini && \
    sed -i 's/.*rpc-endpoint.*/rpc-endpoint = 0.0.0.0:8090/' /peerplays/witness_node_data_dir/config.ini && \
    sed -i 's/.*genesis-json.*/genesis-json = genesis.json/' /peerplays/witness_node_data_dir/config.ini && \
    sed -i '/^plugins/ s/$/ peerplays_sidechain/' /peerplays/witness_node_data_dir/config.ini && \
    sed -i 's/.*enable-stale-production.*/enable-stale-production = true/' /peerplays/witness_node_data_dir/config.ini && \
    sed -i 's/.*witness-id[^s].*/# witness-id = /' /peerplays/witness_node_data_dir/config.ini && \
    sed -i 's/.*witness-ids.*/witness-ids = \["1.6.1", "1.6.2", "1.6.3", "1.6.4", "1.6.5", "1.6.6", "1.6.7", "1.6.8", "1.6.9", "1.6.10", "1.6.11"\]/' /peerplays/witness_node_data_dir/config.ini && \
    sed -i 's/^private-key.*$/private-key = \["TEST6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV", "5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3"\]/' /peerplays/witness_node_data_dir/config.ini && \
    sed -i 's/^debug-private-key.*$/debug-private-key = \["TEST6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV", "5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3"\]/' /peerplays/witness_node_data_dir/config.ini

EXPOSE 8090
EXPOSE 9777

ENTRYPOINT cd /peerplays && witness_node --data-dir=/peerplays/witness_node_data_dir
