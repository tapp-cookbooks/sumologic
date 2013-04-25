#node[:sumologic][:email]
#node[:sumologic][:password]
#node[:sumologic][:sources] # To override default system sources
default[:sumologic][:linux][:sources] = "/usr/local/SumoCollector/installerSources/unix_system_logs.json"
default[:sumologic][:solaris][:sources] = "/opt/SumoCollector/installerSources/unix_system_logs.json"
default[:sumologic][:windows][:sources] = '"C:\\Program Files (x86)\\SumoLogicCollector\\installerSources\\localWin.json"'


