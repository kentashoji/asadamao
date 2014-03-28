template "/etc/sensu/conf.d/check-disk.json" do
  owner "sensu"
  group "sensu"
  mode  0755
  source "check-disk.json.erb"
end

service "sensu-api" do
  action :restart
end
