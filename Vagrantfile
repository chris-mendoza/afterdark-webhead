# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.define "centos" do |vm_cfg|
    vm_cfg.vm.box = "opscode-centos-6.4"
    vm_cfg.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.4_chef-provisionerless.box"
    vm_cfg.vm.network :private_network, ip: "192.168.254.133"
    vm_cfg.vm.hostname = "afterdark-webhead-vagrant-centos"
  end
  
  config.vm.define "ubuntu" do |vm_cfg|
    vm_cfg.vm.box = "opscode-ubuntu-12.04"
    vm_cfg.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-12.04_chef-provisionerless.box"
    vm_cfg.vm.network :private_network, ip: "192.168.254.134"
    vm_cfg.vm.hostname = "afterdark-webhead-vagrant-ubuntu"
  end                 
  
  # Install latest Chef
  # https://github.com/schisamo/vagrant-omnibus
  config.omnibus.chef_version = :latest #'11.8.2'

  # The path to the Berksfile to use with Vagrant Berkshelf
  # config.berkshelf.berksfile_path = "./Berksfile"

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = true

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []

  config.vm.provision :chef_solo do |chef|
    chef.json = {
    }

    chef.run_list = [
        "recipe[afterdark-webhead::default]"
    ]
  end
end
