Vagrant.configure("2") do |config|
  config.vm.define "aresmush" do |aresmush|
    aresmush.vm.box = "ubuntu/bionic64"
    aresmush.vm.hostname = "aresmush.internal.lan"
    aresmush.vm.network :private_network, ip: "192.168.100.199"
    aresmush.vm.network "forwarded_port", guest:4201, host:4201, guest_ip: "192.168.100.199"
    aresmush.vm.network "forwarded_port", guest:4202, host:4202
    aresmush.vm.network "forwarded_port", guest:4203, host:4203
    aresmush.vm.network "forwarded_port", guest:80, host:8080
    aresmush.vm.synced_folder "src/", "/opt/src", create: true

    aresmush.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "aresmush"]
    end
    
    aresmush.vm.provision "ansible_local" do |ansible|
       ansible.install_mode = "default"
       ansible.version = "latest"
       ansible.become = true
       ansible.playbook = "/opt/src/playbook.yml"
       ansible.galaxy_role_file = "/opt/src/requirements.yml"
       ansible.limit = "all,localhost"

       
    end
  end

end
