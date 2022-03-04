IMAGE_NAME = "bento/ubuntu-20.04"
N = 2

Vagrant.configure('2') do |config|
    config.ssh.insert_key = false
    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2 
    end 

    config.vm.define "k8s-budapest-0000" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "10.11.12.10"
        master.vm.hostname = "k8s-budapest-0000"
        master.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible_k8s/master-playbook.yml"
            ansible.extra_vars = {
                node_ip: "10.11.12.10",
            }
        end
    end

    (1..N).each do |i|
        config.vm.define "k8s-budapest-000#{i}" do |node|
            node.vm.box = IMAGE_NAME
            node.vm.network "private_network", ip: "10.11.12.#{i + 10}"
            node.vm.hostname = "k8s-budapest-000#{i}"
            node.vm.provision "ansible" do |ansible|
                ansible.playbook = "ansible_k8s/worker-playbook.yml"
                ansible.extra_vars = {
                    node_ip: "10.11.12.#{i + 10}",
                }
            end
        end
    end
end
