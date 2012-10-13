#
# Cookbook Name:: graphite
# Recipe:: default
#
# Copyright (c) 2012, Ben Bleything <ben@bleything.net>
#
# Released under the terms of the MIT License. See README.md for details.
#

remote_file "/usr/src/graphite-web-#{node.graphite.version}.tar.gz" do
  source node.graphite.web_url
  not_if { File.exist? name }
end

execute("tar zxf graphite-web-#{node.graphite.version}.tar.gz") do
  cwd     "/usr/src"
  creates "/usr/src/graphite-web-#{node.graphite.version}"
end

### install graphite-web
package "apache2"
package "libapache2-mod-wsgi"
package "memcached"
package "python-cairo"
package "python-django"
package "python-django-tagging"
package "python-memcache"
package "python-twisted"

execute "python setup.py install" do
  cwd "/usr/src/graphite-web-#{node.graphite.version}"
  creates "/opt/graphite/webapp"
end

execute "python manage.py syncdb --noinput" do
  cwd "/opt/graphite/webapp/graphite"
  creates "/opt/graphite/storage/graphite.db"
end

directory "/opt/graphite/storage" do
  group 'www-data'
  mode  0775
end

directory "/opt/graphite/storage/log/webapp" do
  group 'www-data'
  mode  0775
end

execute "chown www-data:www-data /opt/graphite/storage/graphite.db"

link "/opt/graphite/conf/graphite.wsgi" do
  to "/opt/graphite/conf/graphite.wsgi.example"
end

cookbook_file("/etc/apache2/sites-available/graphite") { mode 0644 }
execute "a2dissite 000-default"
execute "a2ensite graphite"
execute "apache2ctl restart"
