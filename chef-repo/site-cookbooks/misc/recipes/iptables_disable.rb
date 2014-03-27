service "iptables" do
  action [:stop, :disable]
    ignore_failure true
end
