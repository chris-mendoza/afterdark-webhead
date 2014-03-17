#
# Cookbook Name:: afterdark-webhead
# Recipe:: nginx
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
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
