#
# Cookbook Name:: afterdark-webhead
# Recipe:: content: Install the content of the site
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

user node['afterdark-webhead']['content-user'] do
  comment "AfterDark Web Content"
  system true
  shell "/bin/false"
end

group node['afterdark-webhead']['content-group'] do
  members node['afterdark-webhead']['content-user']
  append false
end

directory node['afterdark-webhead']['content-path'] do
  owner node['afterdark-webhead']['content-user']
  group node['afterdark-webhead']['content-group']
  mode 00755
  recursive true
  action :create
end

package "git" do
  action :install
end

git node['afterdark-webhead']['content-path'] do
  repository "https://github.com/bryanbraun/after-dark-css.git"
  user node['afterdark-webhead']['content-user']
  group node['afterdark-webhead']['content-group']
  action :sync
end
