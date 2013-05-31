#
# Cookbook Name:: graphite
# Recipe:: default
#
# Copyright (c) 2012, Ben Bleything <ben@bleything.net>
#
# Released under the terms of the MIT License. See README.md for details.
#

execute "apt-get update"

include_recipe "graphite::whisper"
include_recipe "graphite::carbon"
include_recipe "graphite::web"
