template "/etc/sensu/conf.d/check-disk.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "check-disk.json.erb"
end

template "/etc/sensu/conf.d/vmstat-metrics.json" do
  owner "sensu"
  group "sensu"
  mode 0755
  source "vmstat-metrics.json.erb"
end

remote_file "/etc/sensu/plugins/graphite.rb" do
  source "https://github.com/sensu/sensu-community-plugins/raw/master/mutators/graphite.rb"
end

template "/etc/sensu/conf.d/handler-graphite.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "handler-graphite.json.erb"
end

template "/etc/sensu/conf.d/mutator-graphite.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "mutator-graphite.json.erb"
end

service "sensu-api" do
  action :restart
end
