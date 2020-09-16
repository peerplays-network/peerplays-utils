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
const {ChainConfig} = require("peerplaysjs-lib");

class PeerplaysClaimBalanceWorkload extends WorkloadModuleBase {
    constructor() {
        super();
    }

    async initializeWorkloadModule(workerIndex, totalWorkers, roundIndex, roundArguments, sutAdapter, sutContext) {
        await super.initializeWorkloadModule(workerIndex, totalWorkers, roundIndex, roundArguments, sutAdapter, sutContext);
    }

    async submitTransaction() {
        if (this.workerIndex == 0) {
            let args = [
                {
                    api_name: null,
                    method: 'balance_claim',
                    params: [
                        {
                            fee: {
                                amount: 0,
                                asset_id: '1.3.0'
                            },
                            deposit_to_account: '1.2.18',
                            balance_to_claim: '1.15.0',
                            balance_owner_key: 'PPY6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV',
                            total_claimed: {
                                amount: 1000000000000000,
                                asset_id: '1.3.0'
                            }
                        }
                    ],
                    readOnly: false
                }
            ];
            await this.sutAdapter.sendRequests(args);
        } else {
            let args = [
                {
                    api_name: 'database',
                    method: 'get_account_balances',
                    params: ['nathan', []],
                    readOnly: true
                }
            ];
            await this.sutAdapter.sendRequests(args);
        }
    }

    async cleanupWorkloadModule() {
        //
    }
}

function createWorkloadModule() {
    return new PeerplaysClaimBalanceWorkload();
}

module.exports.createWorkloadModule = createWorkloadModule;
