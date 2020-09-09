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

const {WorkloadModuleInterface} = require('@hyperledger/caliper-core');

class PeerplaysQueryWorkload extends WorkloadModuleInterface {
    constructor() {
        super();
        this.workerIndex = -1;
        this.totalWorkers = -1;
        this.roundIndex = -1;
        this.roundArguments = undefined;
        this.sutAdapter = undefined;
        this.sutContext = undefined;
    }

    async initializeWorkloadModule(workerIndex, totalWorkers, roundIndex, roundArguments, sutAdapter, sutContext) {
        this.workerIndex = workerIndex;
        this.totalWorkers = totalWorkers;
        this.roundIndex = roundIndex;
        this.roundArguments = roundArguments;
        this.sutAdapter = sutAdapter;
        this.sutContext = sutContext;
    }

    async submitTransaction() {
        let args = [
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init0', []]
            },
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init1', []]
            },
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init2', []]
            },
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init3', []]
            },
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init4', []]
            },
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init5', []]
            },
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init6', []]
            },
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init7', []]
            },
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init8', []]
            },
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init9', []]
            }
        ];

        await this.sutAdapter.sendRequests(args);
    }

    async cleanupWorkloadModule() {
        //
    }
}

function createWorkloadModule() {
    return new PeerplaysQueryWorkload();
}

module.exports.createWorkloadModule = createWorkloadModule;
