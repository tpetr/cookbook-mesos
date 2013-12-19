#
# Cookbook Name:: mesos
# Recipe:: slave
#
# Copyright 2013, Shingo Omura
#
# All rights reserved - Do Not Redistribute
#

deploy_dir = File.join("var", "mesos", "deploy")
installed = File.exists?("/usr/local/sbin/mesos-slave")

if !installed then
  include_recipe "mesos::install_from_mesosphere"
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


