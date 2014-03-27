class Chef
  class Recipe
    def node_name
      if @node["sensu-client"]["name"] then
        node_name = @node["sensu-client"]["name"]
      else
        node_name = Chef::Config[:node_name]
      end
      return node_name
    end
  end
end
