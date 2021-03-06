#
# Cookbook Name:: afterdark-webhead
# Recipe:: nginx
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

node.default['rackspace_nginx']['config']['default_site_enabled'] = false
node.default['rackspace_nginx']['repo_source'] = 'nginx'

include_recipe "rackspace_nginx"

template "/etc/nginx/sites-available/000-afterdark" do
  source "000-afterdark.erb"
  mode 0644
  owner "root"
  group "root"
  notifies :reload, "service[nginx]"
end

nginx_site "000-afterdark" do
  enable true
end
