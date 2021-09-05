# Atualizar os repositórios apt

sudo apt update

echo ('Instalando o virtualBox')
sudo apt install virtualbox -y

echo ('Instalando o repositório da Haschicorp')
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

echo ('Instalando o Vagrant'
sudo apt install vagrant -y

echo ('instalando o python')
sudo apt install python3 -y

echo ('instalando o Ansible')
sudo apt install ansible -y


