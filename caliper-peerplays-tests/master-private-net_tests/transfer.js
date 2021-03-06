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

const {WorkloadModuleBase} = require('@hyperledger/caliper-core');

class PeerplaysTransferWorkload extends WorkloadModuleBase {
    constructor() {
        super();
    }

    async initializeWorkloadModule(workerIndex, totalWorkers, roundIndex, roundArguments, sutAdapter, sutContext) {
        await super.initializeWorkloadModule(workerIndex, totalWorkers, roundIndex, roundArguments, sutAdapter, sutContext);
    }

    async submitTransaction() {
        let args = [
            {
                api_name: null,
                method: 'transfer',
                params: [
                    {
                        fee: {
                            amount: 2000000,
                            asset_id: '1.3.0'
                        },
                        from: '1.2.18',
                        to: '1.2.7',
                        amount: {
                            amount: 100000000,
                            asset_id: '1.3.0'
                        }
                    }
                ],
                readOnly: false
            }
        ];

        await this.sutAdapter.sendRequests(args);
    }

    async cleanupWorkloadModule() {
        //
    }
}

function createWorkloadModule() {
    return new PeerplaysTransferWorkload();
}

module.exports.createWorkloadModule = createWorkloadModule;
