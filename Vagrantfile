# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
	BOX_IMAGE = "ubuntu/jammy64"
	BASE_NETWORK = "10.10.20"
	
	PROXY_ENABLE = true
	PROXY_HTTP = "http://10.0.2.2:5865"
	PROXY_HTTPS = "http://10.0.2.2:5865"
	PROXY_EXCLUDE = "localhost,127.0.0.1"
	
	BOX_CHK_UPDATE = false
	SSH_INSERT_KEY = true
	VB_CHK_UPDATE = false
	
	
	config.vm.define "web" do |subconfig|

		subconfig.vm.box = BOX_IMAGE
		subconfig.vm.synced_folder "www/", "/var/www/html"

		if Vagrant.has_plugin?("vagrant-proxyconf") && PROXY_ENABLE == true
            subconfig.proxy.http = PROXY_HTTP
            subconfig.proxy.https = PROXY_HTTPS
            subconfig.proxy.no_proxy = PROXY_EXCLUDE
        end
		if Vagrant.has_plugin?("vagrant-vbguest")
			subconfig.vbguest.auto_update = VB_CHK_UPDATE
		end
		
		subconfig.vm.network "private_network", ip: "#{BASE_NETWORK}.10", virtualbox__intnet: true
		subconfig.vm.hostname = "mmweb.cpt.local"
		subconfig.vm.network "forwarded_port", guest: 80, host: 9080
		
		subconfig.vm.provider "virtualbox" do |vb|
			vb.name = "MMWeb"
			vb.memory = "1024"
			vb.cpus = 1
		end
		
		subconfig.vm.box_check_update = BOX_CHK_UPDATE
		subconfig.ssh.insert_key = SSH_INSERT_KEY
		
		#provisioning
		subconfig.vm.provision "shell", path: "./scripts/provision_update.sh"
		subconfig.vm.provision "shell", path: "./scripts/provision_apache.sh"
		subconfig.vm.provision "shell", path: "./scripts/provision_php.sh"
		
		

	end
	
	config.vm.define "db" do |subconfig|

		subconfig.vm.box = BOX_IMAGE

		if Vagrant.has_plugin?("vagrant-proxyconf") && PROXY_ENABLE == true
            subconfig.proxy.http = PROXY_HTTP
            subconfig.proxy.https = PROXY_HTTPS
            subconfig.proxy.no_proxy = PROXY_EXCLUDE
        end
		if Vagrant.has_plugin?("vagrant-vbguest")
			subconfig.vbguest.auto_update = VB_CHK_UPDATE
		end
		
		subconfig.vm.network "private_network", ip: "#{BASE_NETWORK}.15", virtualbox__intnet: true
		subconfig.vm.hostname = "mmdb.cpt.local"
		
		subconfig.vm.provider "virtualbox" do |vb|
			vb.name = "MMDb"
			vb.memory = "1024"
			vb.cpus = 1
		end

		subconfig.vm.box_check_update = BOX_CHK_UPDATE
		subconfig.ssh.insert_key = SSH_INSERT_KEY
		
		#provisioning
		subconfig.vm.provision "shell", path: "./scripts/provision_update.sh"
		subconfig.vm.provision "shell", path: "./scripts/provision_mysql.sh"
		subconfig.vm.provision "shell", path: "./scripts/provision_db.sh"

	end
 
end