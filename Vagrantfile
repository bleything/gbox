Vagrant::Config.run do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  # That's 10.gr.ap.hs
  config.vm.network :hostonly, "10.47.27.47"

  # http://localhost:47274 ... yes, http://localhost:graph
  config.vm.forward_port 80, 47274
  config.vm.forward_port 2003, 2003

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "graphite"
  end
end
