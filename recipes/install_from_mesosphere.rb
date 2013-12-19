#
# Cookbook Name:: mesos
# Recipe:: install
#
# Copyright 2013, Shingo Omura
#
# All rights reserved - Do Not Redistribute
#
version = node[:mesos][:version]
download_url = "http://downloads.mesosphere.io/master/ubuntu/12.04/mesos_#{version}_amd64.deb"
installed = File.exist?("/usr/local/sbin/mesos-master")

if installed then
  Chef::Log.info("Mesos is already installed!! Instllation will be skipped.")
end

remote_file "#{Chef::Config[:file_cache_path]}/mesos_#{version}.deb" do
  source "#{download_url}"
  mode   "0644"
  not_if { installed==true }
end

dpkg_package "mesos" do
	source "#{Chef::Config[:file_cache_path]}/mesos_#{version}.deb"
	action :install
end