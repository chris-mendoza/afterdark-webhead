#
# Cookbook Name:: afterdark-webhead
# Recipe:: acl
#
# Copyright 2014, Rackspace, US Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

add_iptables_rule('INPUT', '-m state --state RELATED,ESTABLISHED -j ACCEPT', 1000, 'Allow Established Connections')
add_iptables_rule('INPUT', '-i lo -j ACCEPT', 1000, 'Allow Loopback')
add_iptables_rule('INPUT', "-s #{node["ipaddress"]}/32 -j ACCEPT", 1, 'Allow Ourself')
add_iptables_rule('INPUT', '-s 0.0.0.0/0 -j REJECT', 0)
add_iptables_rule('FORWARD', '-s 0.0.0.0/0 -j REJECT', 0)

add_iptables_rule('INPUT', '-p tcp -m tcp --dport 22 -j ACCEPT', 800, 'Open SSH globally')
add_iptables_rule('INPUT', '-p tcp -m tcp --dport 80 -j ACCEPT', 800, 'Open HTTP globally')

# Ensure rackspace_iptables is included
include_recipe 'rackspace_iptables'
