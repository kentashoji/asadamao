default["sensu"]["use_ssl"] = false
default["sensu"]["use_embedded_ruby"] = true
default["sensu"]["rabbitmq"]["host"] = "192.168.33.10"
default["sensu"]["rabbitmq"]["port"] = 5672
default["sensu"]["rabbitmq"]["user"] = "admin"
default["sensu"]["rabbitmq"]["password"] = "password"
default["sensu"]["api"]["host"] = "192.168.33.10"
default["sensu"]["api"]["port"] = 9000 

# dummy enviroment
default["sensu-client"]["name"] = false
default["sensu-client"]["ipaddress"] = false
default["sensu-client"]["role"] = ["server"]

