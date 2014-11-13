# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu-14.04-64-puppet"
  config.vm.box_url = "https://vagrantcloud.com/puppetlabs/boxes/ubuntu-14.04-64-puppet/versions/1/providers/virtualbox.box"

  config.vm.network :forwarded_port, host: 8880, guest: 8080
  config.vm.network :forwarded_port, host: 8843, guest: 8443
  config.vm.network :forwarded_port, host: 8822, guest: 8022
  config.vm.network :forwarded_port, host: 8887, guest: 8787
  config.vm.network :forwarded_port, host: 27016, guest: 27017

  # need to install vagrant-proxyconf if Vagrant is running behind firewall
  # vagrant plugin install vagrant-proxyconf
  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "http://10.56.140.175:3128"
    config.proxy.https    = "http://10.56.140.175:3128"
    config.proxy.no_proxy = "localhost,127.0.0.1"
  end

  # Use puppet provisionner to configure everything else
  config.vm.provision :puppet do |puppet|
    puppet.module_path = "modules"
    puppet.options = "-v -d"
    puppet.facter = { "vagrant_box" => true }
  end

end
