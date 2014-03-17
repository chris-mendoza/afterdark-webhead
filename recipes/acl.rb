#
# Cookbook Name:: afterdark-webhead
# Recipe:: acl
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

add_iptables_rule('INPUT', '-m state --state RELATED,ESTABLISHED -j ACCEPT', 1000, 'Allow Established Connections')
add_iptables_rule('INPUT', '-i lo -j ACCEPT', 1000, 'Allow Loopback')
add_iptables_rule('INPUT', "-s #{node["ipaddress"]}/32 -j ACCEPT", 1, 'Allow Ourself')
add_iptables_rule('INPUT', '-s 0.0.0.0/0 -j REJECT', 0)

add_iptables_rule('INPUT', '-p tcp -m tcp --dport 22 -j ACCEPT', 800, 'Open SSH globally')
add_iptables_rule('INPUT', '-p tcp -m tcp --dport 80 -j ACCEPT', 800, 'Open HTTP globally')

# Ensure rackspace_iptables is included
include_recipe 'rackspace_iptables'
