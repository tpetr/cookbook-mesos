#
# Cookbook Name:: mesos
# Recipe:: slave
#
# Copyright 2013, Shingo Omura
#
# All rights reserved - Do Not Redistribute
#

build_from_source = node[:mesos][:build_from_source]
prefix = node[:mesos][:prefix]
deploy_dir = File.join(prefix, "var", "mesos", "deploy")
installed = File.exists?(File.join(prefix, "sbin", "mesos-master"))

if !installed then
  if build_from_source
    include_recipe "mesos::build_from_source"
  else  
    include_recipe "mesos::install_from_mesosphere"
  end
end

template File.join(deploy_dir, "mesos-deploy-env.sh") do
  source "mesos-deploy-env.sh.erb"
  mode 644
  owner "root"
  group "root"
end

template File.join(deploy_dir, "mesos-slave-env.sh") do
  source "mesos-slave-env.sh.erb"
  mode 644
  owner "root"
  group "root"
end


