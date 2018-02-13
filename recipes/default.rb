#
# Cookbook Name:: mongo_newrelic_monitoring
# Recipe:: default
#
# Copyright 2018.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

directory '/usr/local/newrelic/' do
  mode '0755'
  action :create
end

remote_file '/usr/local/newrelic/v2.4.6.zip' do
  source 'https://github.com/eksoverzero/newrelic_mongodb_agent/archive/v2.4.6.zip'
  mode '0755'
  action :create
end

execute 'extract_mongo_agent' do
  command 'unzip v2.4.6.zip'
  cwd '/usr/local/newrelic/'
end

execute 'move_file' do
  command 'mv newrelic_mongodb_agent-2.4.6 /usr/local/newrelic/newrelic_mongodb_agent'
  cwd '/usr/local/newrelic/'
end

file '/usr/local/newrelic/v2.4.6.zip' do
  action :delete
end

package %w(gcc ruby-devel rubygems)
gem_package 'bundler'

gem_package 'bson' do
  version '1.10.2'
end

gem_package 'bson_ext' do
  version '1.10.2'
end

gem_package 'daemons' do
  version '1.1.9'
end

gem_package 'json' do
  version '1.8.1'
end

gem_package 'mongo' do
  version '1.10.2'
end

gem_package 'newrelic_plugin' do
  version '1.3.1'
end

template "/usr/local/newrelic/newrelic_mongodb_agent/config/newrelic_plugin.yml" do
  source "newrelic_plugin.yml.erb"
  mode "0775"
end

template "/etc/init.d/newrelic_mongodb_agent" do
  source "mongo-newrelic-agent.erb"
  mode "0775"
end

service 'newrelic_mongodb_agent' do
  action [ :enable, :start ]
  supports :reload => true, :restart => true, :status => true, :stop => true
  subscribes :restart, 'file[/usr/local/newrelic/newrelic_mongodb_agent/config/newrelic_plugin.yml]', :immediately
  subscribes :restart, 'file[/etc/init.d/newrelic_mongodb_agent]', :immediately
end