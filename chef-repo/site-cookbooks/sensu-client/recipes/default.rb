#
# Cookbook Name:: sensu-client
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "sensu::default"

ipaddress = node["ipaddress"]

node_name = node_name()

sensu_client node_name do
  address ipaddress
  subscriptions ["all"]
end

execute "chmod 644 /etc/sensu/conf.d/client.json" do
  action :run
end

include_recipe "sensu::client_service"

remote_file "/etc/sensu/plugins/check-disk.rb" do
  source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/system/check-disk.rb"
  mode 0755
end

remote_file "/etc/sensu/plugins/vmstat-metrics.rb" do
  source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/system/vmstat-metrics.rb"
  mode 0755
end

service "sensu-client" do
  action :restart
end
