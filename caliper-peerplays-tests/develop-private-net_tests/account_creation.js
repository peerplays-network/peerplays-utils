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

class PeerplaysAccountCreationWorkload extends WorkloadModuleBase {
    constructor() {
        super();
        this.txIndex = -1;
    }

    async initializeWorkloadModule(workerIndex, totalWorkers, roundIndex, roundArguments, sutAdapter, sutContext) {
        await super.initializeWorkloadModule(workerIndex, totalWorkers, roundIndex, roundArguments, sutAdapter, sutContext);
    }

    async submitTransaction() {
        this.txIndex++;

        const account_name = `account-${this.roundIndex}-${this.workerIndex}-${this.txIndex}`;

        let args = [
            {
                api_name: 'database',
                method: 'account_create',
                params: [
                    {
                        "fee": {
                            "amount": 200015000,
                            "asset_id": "1.3.0"
                        },
                        "registrar": "1.2.18",
                        "referrer": "1.2.18",
                        "referrer_percent": 0,
                        "name": account_name,
                        "owner": {
                            "weight_threshold": 1,
                            "account_auths": [],
                            "key_auths": [[
                                    "TEST5orHpy1AohBuFRiddAC8VXzFy6o2yoVN9LB1kzgCKMJ7hAqD2o",
                                    1
                                ]
                            ],
                            "address_auths": []
                        },
                        "active": {
                            "weight_threshold": 1,
                            "account_auths": [],
                            "key_auths": [[
                                    "TEST7e7WvJf5Sebfcp7M4cjfhroxth2aYuhz3fmcXGiVHhpM3ThgTH",
                                    1
                                ]
                            ],
                            "address_auths": []
                        },
                        "options": {
                            "memo_key": "TEST5tpohCDCiucGSXS4u2AZwbPu79DfvHPw7LDdX3gJgjjjeLwKXi",
                            "voting_account": "1.2.5",
                            "num_witness": 0,
                            "num_committee": 0,
                            "votes": [],
                            "extensions": []
                        },
                        "extensions": {}
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
    return new PeerplaysAccountCreationWorkload();
}

module.exports.createWorkloadModule = createWorkloadModule;
