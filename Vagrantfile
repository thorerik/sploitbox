Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu-i3'
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.provider 'virtualbox' do |v|
    v.gui = true
    v.memory = 4096
    v.cpus = 4
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
  end
  config.vm.provision 'shell', path: 'scripts/post.sh'
end
