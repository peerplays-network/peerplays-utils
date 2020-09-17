/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use strict';

const {BlockchainConnector, CaliperUtils, ConfigUtil, TxStatus} = require('@hyperledger/caliper-core');
const logger = CaliperUtils.getLogger('peerplays-connector');

const {Apis, ApisInstance, ChainConfig, PrivateKey, TransactionBuilder} = require("peerplaysjs-lib");

/**
 * @typedef {Object} PeerplaysInvoke
 *
 * @property {string} api_name Required. The name of the API
 * @property {string} method Required. The name of the method to call
 * @property {string} params Required. Parameters of the method to call
 * @property {string} readOnly Optional. Is method read only, or requires transaction
 */

const PeerplaysConnector = class extends BlockchainConnector {

    constructor(workerIndex) {
        super();
        this.bcType = 'peerplays';

        let configPath = CaliperUtils.resolvePath(ConfigUtil.get(ConfigUtil.keys.NetworkConfig));
        let peerplaysConfig = require(configPath).peerplays;

        this.checkConfig(peerplaysConfig);

        this.peerplaysConfig = peerplaysConfig;
        this.clientIndex = workerIndex;
        this.context = undefined;

        this.expirationOffset = 0;

        logger.info('Connecting to Peerplays endpoint ' + this.peerplaysConfig.url);
        const apiInstance = Apis.instance(this.peerplaysConfig.url, true);

        apiInstance.init_promise
                .then(() => {
                    this.apiInstance = apiInstance;
                    ChainConfig.setPrefix(this.peerplaysConfig.coreAssetName);
                })
                .catch(error => {
                    logger.error('init_promise failed, reason: ' + error.message);
                });
    }

    checkConfig(peerplaysConfig) {
        if (!peerplaysConfig.url) {
            throw new Error('No URL given');
        }

        if (peerplaysConfig.url.toLowerCase().indexOf('http') === 0) {
            throw new Error('Must not use http(s) RPC connections');
        }

        //TODO: add validation logic for the rest of the configuration object
    }

    async init(workerInit) {
        logger.info('PeerplaysConnector.init');
    }

    async installSmartContract() {
        logger.info('PeerplaysConnector.installSmartContract');
    }

    async getContext(roundIndex, args) {
        let context = {
            clientIndex: this.clientIndex,
            apiInstance: this.apiInstance
        };

        this.context = context;
        return context;
    }

    async releaseContext() {
        logger.info('PeerplaysConnector.releaseContext');
    }

    async _sendSingleRequest(request) {
        const context = this.context;
        let status = new TxStatus();

        const onFailure = (err) => {
            status.SetStatusFail();
            logger.error('Failed Peerplays call: ' + JSON.stringify(request));
            logger.error(err);
        };

        const onSuccess = (rec) => {
            status.SetID(rec.transactionHash);
            status.SetResult(rec);
            status.SetVerification(true);
            status.SetStatusSuccess();
        };

        if (request.readOnly) {
            try {
                let receipt = undefined;
                switch (request.api_name) {
                    case "database":
                        receipt = await this.apiInstance.db_api().exec(request.method, request.params);
                        break;
                    case "network_broadcast":
                        receipt = await this.apiInstance.network_api().exec(request.method, request.params);
                        break;
                    case "history":
                        receipt = await this.apiInstance.history_api().exec(request.method, request.params);
                        break;
                    case "crypto":
                        receipt = await this.apiInstance.crypto_api().exec(request.method, request.params);
                        break;
                    case "bookie":
                        receipt = await this.apiInstance.bookie_api().exec(request.method, request.params);
                        break;
                    default:
                }
                onSuccess(receipt);
            } catch (err) {
                onFailure(err);
            }
        } else {
            let txBuilder = new TransactionBuilder();
            let receipt = undefined;

            try {
                txBuilder.add_type_operation(request.method, request.params[0]);
                await txBuilder.set_required_fees();
                let PrivKey = PrivateKey.fromWif(this.peerplaysConfig.nathanPrvKey);
                txBuilder.add_signer(PrivKey, PrivKey.toPublicKey());
                const now = new Date();
                txBuilder.set_expire_seconds(Math.floor(now.getTime() / 1000) + 43200 + 30 * this.clientIndex + this.expirationOffset++);
                [receipt] = await txBuilder.broadcast();
                onSuccess(receipt);
            } catch (err) {
                onFailure(err);
            }
        }

        return status;
    }

    async prepareWorkerArguments(number) {
        let result = [];
        for (let i = 0; i < number; i++) {
            result[i] = {}; // as default, return an empty object for each client
        }
        return result;
    }

}

module.exports = PeerplaysConnector;
