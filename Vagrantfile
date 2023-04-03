Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.hostname = "ubuntu-test"
  config.vm.network "public_network"
  config.vm.box_check_update = false
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
  end

  config.vm.define "db01" do |db01|
    db01.vm.network "public_network", ip: "192.168.0.123"
    db01.vm.hostname = "db01"
    db01.vm.provision "shell", path: "./db_files/db_provision.sh"
  end

  config.vm.define "keycloak01" do |keycloak01|
    keycloak01.vm.hostname = "keycloak01"
    keycloak01.vm.provision "shell", path: "./keycloak_files/keycloak_provision.sh"
  end

end
