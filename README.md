# K8s playground 

<p align="center">
  <img width="" height="" src="https://apprenda.com/wp-content/uploads/Webinar_K8S101_K8slogo.png">
</p>


Deploy do K8s  usando Vagrant + Ansible, este deploy é para fins didáticos favor utilizar apenas em ambiente de testes, as versões dos software utilizadas foram:

### Requerimentos
``` shell
* Vagrant 2.2.14
* Virtualbox 6.1.16
* Python 3.8.6
* Ansible 2.9.9
```
Criei um executável para facilitar a instalação das ferramentas, basta executar install.sh e a instalação das dependências sera feita automaticamente
``` shell
./install.sh
```
Ou você pode instalar as ferramentas manualmente
### Downloads
* Vagrant
  Download -> https://www.vagrantup.com/downloads
* VirtualBox
  Download -> https://www.virtualbox.org/wiki/Downloads
* Python
  Download -> https://www.python.org/downloads/
* Ansible
  Informações sobre instalação no windows -> https://www.ansible.com/for/windows


### Modo de uso

Entre na pasta do projeto e execute o script onde esta o Vagrantfile:

``` shell
vagrant up
```

Aguarde o termino das confs, para acessar o cluster, basta digitar:

``` shell
vagrant ssh k8s-master
```
