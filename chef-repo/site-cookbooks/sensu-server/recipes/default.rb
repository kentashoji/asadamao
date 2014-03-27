#
# Cookbook Name:: sensu-server
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if node["sensu-server-wrapper"]["iptables_enabled"]

  include_recipe "iptables"

  directory "/etc/iptables.d/iptables" do
    action :create
  end
  
  iptables_rule "iptables/sensu_dashboard"
  iptables_rule "iptables/rabbitmq"
  iptables_rule "iptables/sensu_api"
  iptables_rule "iptables/ssh"
end

if node["sensu-server-wrapper"]["use_apache"]
  include_recipe "apache2"
  template "/etc/httpd/conf.d/sensu.conf" do
    owner "root"
    group "root"
    mode "0644"
    source "sensu.conf.erb"
  end 
  if node["sensu-server-wrapper"]["iptables_enabled"]
    iptables_rule "iptables/http"
  end
  service "httpd" do
    action :restart
  end
end

package "erlang" do
  action :install
end

include_recipe "sensu::default"
include_recipe "sensu::rabbitmq"
include_recipe "sensu::redis"
include_recipe "sensu::api_service"
include_recipe "sensu::dashboard_service"
include_recipe "sensu::server_service"

