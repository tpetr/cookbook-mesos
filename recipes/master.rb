#
# Cookbook Name:: mesos
# Recipe:: master
#
# Copyright 2013, Shingo Omura
#
# All rights reserved - Do Not Redistribute
#

deploy_dir = node[:deploy_dir]
installed = File.exists?("/usr/local/sbin/mesos-master")

if !installed then
  include_recipe "mesos::install_from_mesosphere"
end

directory deploy_dir do
  owner "root"
  group "root"
  action :create
end

template File.join(deploy_dir, "masters") do
  source "masters.erb"
  mode 644
  owner "root"
  group "root"
end

template File.join(deploy_dir, "slaves") do
  source "slaves.erb"
  mode 644
  owner "root"
  group "root"
end

template File.join(deploy_dir, "mesos-deploy-env.sh") do
  source "mesos-deploy-env.sh.erb"
  mode 644
  owner "root"
  group "root"
end

template File.join(deploy_dir, "mesos-master-env.sh") do
  source "mesos-master-env.sh.erb"
  mode 644
  owner "root"
  group "root"
end


