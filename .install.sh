#!/bin/bash

# Função para instalar no Linux (Ubuntu/Debian)
install_on_linux() {
    # Atualizar os repositórios apt
    sudo apt update

    echo 'Instalando o VirtualBox'
    sudo apt install virtualbox -y

    echo 'Instalando o repositório da HashiCorp'
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

    echo 'Atualizando os repositórios apt novamente para atualizar o cache com o novo repositório'
    sudo apt update

    echo 'Instalando o Vagrant'
    sudo apt install vagrant -y

    echo 'Instalando o Python'
    sudo apt install python3 -y

    echo 'Instalando o Ansible'
    sudo apt install ansible -y
}

# Função para instalar no macOS
install_on_macos() {
    # Verificar se o Homebrew está instalado
    if ! command -v brew &>/dev/null; then
        echo 'Homebrew não encontrado. Instalando o Homebrew...'
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi

    echo 'Instalando o VirtualBox'
    brew install --cask virtualbox

    echo 'Instalando o Vagrant'
    brew install --cask vagrant

    echo 'Instalando o Python'
    brew install python

    echo 'Instalando o Ansible'
    brew install ansible
}

# Verificar o sistema operacional e oferecer opções de instalação
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Sistema operacional detectado: Linux"
    echo "Deseja instalar no Linux? (Digite 'sim' ou 's' para confirmar)"
    read -r response
    if [[ "$response" =~ ^([sS][iI][mM]|[yY])$ ]]; then
        install_on_linux
    else
        echo "Instalação no Linux cancelada."
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Sistema operacional detectado: macOS"
    echo "Deseja instalar no macOS? (Digite 'sim' ou 's' para confirmar)"
    read -r response
    if [[ "$response" =~ ^([sS][iI][mM]|[yY])$ ]]; then
        install_on_macos
    else
        echo "Instalação no macOS cancelada."
    fi
else
    echo "Sistema operacional não suportado."
fi
