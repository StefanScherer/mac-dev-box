# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "osx1011-desktop"
  config.ssh.forward_agent = true
  config.ssh.insert_key = false

  config.vm.provision "shell", path: "scripts/enable-hidpi.sh", privileged: false
  config.vm.provision "shell", path: "scripts/set-german.sh", privileged: false
  config.vm.provision "shell", path: "scripts/disable-sleep.sh", privileged: false
  config.vm.provision "shell", path: "scripts/install-brew-cask.sh", privileged: false

  config.vm.provision "shell", path: "scripts/install-resources.sh", privileged: false
  config.vm.provision "shell", path: "scripts/install-chrome.sh", privileged: false
  config.vm.provision "shell", path: "scripts/install-node.sh", privileged: false
  config.vm.provision "shell", path: "scripts/install-atom.sh", privileged: false
  config.vm.provision "shell", path: "scripts/install-cucumber.sh", privileged: false

  config.vm.provision "shell", path: "scripts/install-virtualbox.sh", privileged: false
  config.vm.provision "shell", path: "scripts/install-docker.sh", privileged: false

  # config.vm.provision "shell", path: "scripts/install-packer.sh", privileged: false
  # config.vm.provision "shell", path: "scripts/install-vagrant.sh", privileged: false

  config.vm.hostname = "mac-dev-box"

  config.vm.provider "vmware_fusion" do |v|
    v.gui = true
    v.vmx["memsize"] = "4096"
    v.vmx["numvcpus"] = "2"
    # enable nested hypervisor
    v.vmx["vhv.enable"] = "TRUE"
    # enable HiDPI / Retina
    v.vmx["gui.fitguestusingnativedisplayresolution"] = "TRUE"
    # enable sound
    # v.vmx["sound.startconnected"] = "TRUE"
    # v.vmx["sound.present"] = "TRUE"
    # v.vmx["sound.autodetect"] = "TRUE"
  end
end
