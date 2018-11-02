#!/usr/bin/env bash
# Copyright (c) 2007-2013 Alysson Bessani, Eduardo Alchieri, Paulo Sousa, and the authors indicated in the @author tags
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


# to use this script, change the config/workloads/workloada accordingly to match the number of records desired
# then, to run the experiment make sure that workloada has the proportion of operations (read/update) set
# correctly


echo "recordcount=${RECORDCOUNT}" >> config/workloads/workloada
echo "smart-initkey=${CLIENTID}" >> config/workloads/workloada
echo "insertstart=${INSERTSTART}" >> config/workloads/workloada
echo "insertcount=${INSERTCOUNT}" >>config/workloads/workloada


java -cp ./lib/*:./bin/ com.yahoo.ycsb.Client -load -P config/workloads/workloada  -db bftsmart.demo.ycsb.YCSBClient -s
