# -*- mode: ruby -*-
# # vi: set ft=ruby :
##
## Author: Marc López Rubio
## Mail: marc5.12@outlook.com
## GitHub: https://github.com/marclop
##
 
# Specify Vagrant API version
VAGRANTFILE_API_VERSION = "2"

# Specify latest vagrant version
Vagrant.require_version ">= 1.7.0"
 
# Set configuration options
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  # Specify CentOS 7 Box with EPEL Repository installed
  config.vm.box = "chef/centos-7.0"
  config.vm.hostname = "base"

  # Set GUI hostname
  config.vm.define "base" do |base|
  end

  # Specify repository to be pushed to
  config.push.define "atlas" do |push|
    push.app = "marclop/centos7-salt"
  end
 
  # Share current folder as /vagrant to the guest VM and use SAMBA as a transport
  config.vm.synced_folder ".", "/vagrant", type: "smb"

  # Run setup.sh to provision vm
  config.vm.provision "shell", path: "setup.sh"
 
end