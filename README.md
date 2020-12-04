# Desafio Técnico 01 - 104 Programador DevOps / FUNPEC

## Proposta
Automatize o processo de concessão e revogação de acesso SSH para um grupo de instâncias de servidores para novos desenvolvedores.

## Sobre
Este projeto foi desenvolvido para realizar a atividade técnica 02 do processo de seleção.
Decidi utilizar o Ansible para realizar essa atividade.

Buscando por informações de como gerenciar os usuários usando Ansible achei este [artigo](https://geektechstuff.com/2019/11/03/using-ansible-to-create-and-manage-users-linux-raspberry-pi/) de Geek_Dude, junto com o [repositório](https://github.com/geektechdude/AnsiblePlaybook_User_Management_Debian) que ele publicou os códigos.
Usarei esse sistema como base para resolução deste desafio.

Usei este [artigo](https://www.digitalocean.com/community/tutorials/how-to-set-up-ansible-inventories) da Digital Ocean que auxilia na configuração dos inventários.

## Execução

### Instalando o projeto
```
pipenv install
```
Entrando o ambiente virtual python
```
pipenv shell
```

### Configurando o projeto
Criando um inventário para gerenciar os servidores
```
touch inventory
```
Copiar os dados dos servidores para o inventário, ex (Estou utilizando meus rapsberrys para teste):
```
[rpis]
192.168.0.111
192.168.0.110
192.168.0.105
```
Configurar os usuários no arquivo `vars/users.yml` para adição de usuários
Configurar os usuários no arquivo `vars/rem_users.yml` para remoção de usuários

### Executando o projeto
Adicionando os usuários e chaves:
```
ansible-playbook -i inventory playbook_no_pass.yml
```
Removendo os usuários:
```
ansible-playbook -i inventory playbook_remove_users.yml
```