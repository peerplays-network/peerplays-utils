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

const {BlockchainInterface, CaliperUtils, ConfigUtil} = require('@hyperledger/caliper-core');
const logger = CaliperUtils.getLogger('peerplays');

const Peerplays = class extends BlockchainInterface {

    constructor(workerIndex) {
        super();
        this.bcType = 'peerplays';

        let configPath = CaliperUtils.resolvePath(ConfigUtil.get(ConfigUtil.keys.NetworkConfig));
        let peerplaysConfig = require(configPath).peerplays;

        this.checkConfig(peerplaysConfig);

        this.peerplaysConfig = peerplaysConfig;
    }

    checkConfig(peerplaysConfig) {
        if (!peerplaysConfig.url) {
            throw new Error(
                    'No URL given'
                    );
        }

        if (peerplaysConfig.url.toLowerCase().indexOf('http') === 0) {
            throw new Error(
                    'Must not use http(s) RPC connections'
                    );
        }

        //TODO: add validation logic for the rest of the configuration object
    }

    getType() {
        return this.bcType;
    }

    async init(workerInit) {
        throw new Error('init is not implemented for this blockchain system');
    }

    async installSmartContract() {
        logger.info('Creating contracts...');
        throw new Error('installSmartContract is not implemented for this blockchain system');
    }

    async prepareWorkerArguments(number) {
        let result = [];
        for (let i = 0; i < number; i++) {
            result[i] = {}; // as default, return an empty object for each client
        }
        return result;
    }

    async getContext(roundIndex, args) {
        throw new Error('getContext is not implemented for this blockchain system');
    }

    async releaseContext() {
        throw new Error('releaseContext is not implemented for this blockchain system');
    }

    async invokeSmartContract(contractID, contractVersion, invokeSettings, timeout) {
        throw new Error('invokeSmartContract is not implemented for this blockchain system');
    }

    async querySmartContract(contractID, contractVersion, querySettings, timeout) {
        throw new Error('querySmartContract is not implemented for this blockchain system');
    }

    async queryState(context, contractID, contractVer, key, fcn) {
        throw new Error('queryState is not implemented for this blockchain system');
    }

    getDefaultTxStats(stats, results) {
        throw new Error('getDefaultTxStats is not implemented for this blockchain system');
    }
}
;
        module.exports = Peerplays;
