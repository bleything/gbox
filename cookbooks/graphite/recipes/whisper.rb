#
# Cookbook Name:: graphite
# Recipe:: default
#
# Copyright (c) 2012, Ben Bleything <ben@bleything.net>
#
# Released under the terms of the MIT License. See README.md for details.
#

remote_file "/usr/src/whisper-#{node.graphite.version}.tar.gz" do
  source node.graphite.whisper_url
  not_if { File.exist? name }
end

execute("tar zxf whisper-#{node.graphite.version}.tar.gz") do
  cwd     "/usr/src"
  creates "/usr/src/whisper-#{node.graphite.version}"
end

execute "python setup.py install" do
  cwd "/usr/src/whisper-#{node.graphite.version}"
  creates "/usr/local/lib/python2.7/dist-packages/whisper.py"
end
