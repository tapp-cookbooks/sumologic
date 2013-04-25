
if node[:sumologic][:email] # Only, if we have sumo logic account...

	src_filepath = File.join(Chef::Config['file_cache_path'],"sumo-installer.sh")

	# TODO: We currently don't know if we have the current version of sumo installed. But reinstalling on every run is too expensive.
	# For the moment, we don't execute the recipe if there is already a version in the chef cache.
	unless node[:platform] == 'windows' || File.exists?(src_filepath)

		if %w(smartos solaris).member? node[:platform]
			path_name = "solaris/32"
			os = :solaris
		else
			path_name = "linux/64"
			os = :linux
		end 

		template "/etc/sumo.conf" do
			source "sumo.conf.erb"
			owner "root"
			group "root"
			mode "640"
			variables( :hostname => node[:fqdn], :email => node[:sumologic][:email], :password => node[:sumologic][:password], :sources => node[:sumologic][:sources] || node[:sumologic][os][:sources] )
		end

		remote_file src_filepath do
			source "https://collectors.sumologic.com/rest/download/#{path_name}"
			owner 'root'
	  		group 'root'
	  		mode "740"	  
		end

		bash 'install_sumologic' do
			cwd ::File.dirname(src_filepath)
			code "#{src_filepath} -q"
		end

	else

		# Chef::Log.info "My hostname is #{node[:hostname]}, my domain is #{node[:domain]}, and my FQDN is #{node[:fqdn]}"

		# directory "C:\\sumo" do
		# 	owner 'Administrator'
		# 	rights :full_control, 'Administrator'
		# end
 
		# template "C:\\sumo\\sumo.conf" do
		# 	source "sumo.conf.erb"
		# 	owner 'Administrator'
		# 	rights :full_control, 'Administrator'
		# 	variables( :hostname => node[:fqdn], :email => node[:sumologic][:email], :password => node[:sumologic][:password], :sources => node[:sumologic][:sources] || node[:sumologic][:windows][:sources] )
		# end

		# src_filepath = "C:\\sumo\\sumo-installer.exe"

		# remote_file src_filepath do
		# 	source "https://collectors.sumologic.com/rest/download/windows"
		# 	owner 'Administrator'
		# 	rights :full_control, 'Administrator'  
		# end

		# windows_package "SumoLogicCollector" do
		#   source src_filepath
		#   options "-q"
		#   installer_type :custom
		#   action :install
		# end	
	end
end
