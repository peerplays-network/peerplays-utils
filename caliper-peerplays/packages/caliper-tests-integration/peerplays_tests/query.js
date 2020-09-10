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

class PeerplaysQueryWorkload extends WorkloadModuleBase {
    constructor() {
        super();
    }

    async initializeWorkloadModule(workerIndex, totalWorkers, roundIndex, roundArguments, sutAdapter, sutContext) {
        await super.initializeWorkloadModule(workerIndex, totalWorkers, roundIndex, roundArguments, sutAdapter, sutContext);
    }

    async submitTransaction() {
        let args = [
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init0', []],
                readOnly: true
            },
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init1', []],
                readOnly: true
            },
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init2', []],
                readOnly: true
            },
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init3', []],
                readOnly: true
            },
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init4', []],
                readOnly: true
            },
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init5', []],
                readOnly: true
            },
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init6', []],
                readOnly: true
            },
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init7', []],
                readOnly: true
            },
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init8', []],
                readOnly: true
            },
            {
                api_name: 'database',
                method: 'get_account_balances',
                params: ['init9', []],
                readOnly: true
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
