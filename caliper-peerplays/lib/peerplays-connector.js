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

const { BlockchainConnector, CaliperUtils, ConfigUtil } = require('@hyperledger/caliper-core');
const Logger = CaliperUtils.getLogger('peerplays-connector');

const PeerplaysConnector = class extends BlockchainConnector {

    constructor(workerIndex, bcType) {
        super(workerIndex, bcType);

    }

    async getContext(roundIndex, args) {

    }

    async init(workerInit) {
        await this.fabric.init(workerInit);
    }

    async installSmartContract() {

    }

    async invokeSmartContract(contractID, contractVersion, invokeSettings, timeout) {

    }

    async querySmartContract(contractID, contractVersion, querySettings, timeout) {

    }

    async releaseContext() {

    }

};

module.exports = FabricConnector;
