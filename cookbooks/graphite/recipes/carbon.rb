#
# Cookbook Name:: graphite
# Recipe:: default
#
# Copyright (c) 2012, Ben Bleything <ben@bleything.net>
#
# Released under the terms of the MIT License. See README.md for details.
#

remote_file "/usr/src/carbon-#{node.graphite.version}.tar.gz" do
  source node.graphite.carbon_url
  not_if { File.exist? name }
end

execute("tar zxf carbon-#{node.graphite.version}.tar.gz") do
  cwd     "/usr/src"
  creates "/usr/src/carbon-#{node.graphite.version}"
end

### install carbon
execute "python setup.py install" do
  cwd "/usr/src/carbon-#{node.graphite.version}"
  creates "/opt/graphite"
end

cookbook_file("/opt/graphite/conf/carbon.conf") { mode 0644 }
cookbook_file("/opt/graphite/conf/storage-schemas.conf") { mode 0644 }

### enable carbon daemon
cookbook_file("/etc/init/carbon-cache.conf") { mode 0644 }
service "carbon-cache" do
  provider Chef::Provider::Service::Upstart
  action   [:enable, :start]
end
