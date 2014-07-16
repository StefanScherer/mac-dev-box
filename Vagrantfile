# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "osx109"
  config.vm.provision "shell", path: "scripts/provision.sh", privileged: false
  config.vm.hostname = "loader"

  config.vm.provider "vmware_fusion" do |v|
    v.gui = true
    v.vmx["memsize"] = "2048"
    v.vmx["numvcpus"] = "2"
  end
end
