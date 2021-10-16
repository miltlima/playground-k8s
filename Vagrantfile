IMAGE_NAME = "bento/ubuntu-20.04"
N = 2 

Vagrant.configure('2') do |config|
    config.ssh.insert_key = false
    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2 
    end 

    config.vm.define "k8s-master" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "10.11.12.13"
        master.vm.hostname = "k8s-master"
        master.vm.provision "ansible" do |ansible|
            ansible.playbook = "k8s/master-playbook.yml"
            ansible.extra_vars = {
                node_ip: "10.11.12.13",
            }
        end
    end

    (1..N).each do |i|
        config.vm.define "node-#{i}" do |node|
            node.vm.box = IMAGE_NAME
            node.vm.network "private_network", ip: "10.11.12.#{i + 13}"
            node.vm.hostname = "k8s-worker-#{i}"
            node.vm.provision "ansible" do |ansible|
                ansible.playbook = "k8s/node-playbook.yml"
                ansible.extra_vars = {
                    node_ip: "10.11.12.#{i + 13}",
                }
            end
        end
    end
end
