##Este projeto monitora o serviço Nginx em um sistema Linux. Através de um script rodado na cron, para fazer a verificação do status do Nginx, se está online ou offline. Gera logs para cada um dos status. Este script é configurado para ser executado a cada 5 minutos.

1. Instalação do WSL
Abra o PowerShell como adminstrador e rode o comando
wsl --install

-Para uma nova instalação, será requisitado a criação de um usuário e senha
-Após finalizar a instalação, é necessário que o computador seja reiniciado.

2.Instalações
*Antes de qualquer instalação devemos executar o comando: sudo apt upgrade

-Instalar servidor Nginx para rodar o script: sudo apt install nginx
-Instalar o Git para fazer o versionamento no Github: sudo apt install git

2. Criação do Script de Validação
Crie um script no diretório /home/seu-usuário/diretório/.sh onde será validado se o serviço está ONLINE ou OFFLINE.

3. Permissões 
Colocar permissão de execução: chmod +x /home/seu-usuário/diretório/.sh

5. Automatizar o script de 5 em 5 minutos
Edite o arquivo com o comando : crontab -e

-Adicione no final do arquivo: */5 * * * * /bin/bash /home/seu-usuário/diretório/.sh >> /home//home/seu-usuário/diretório/.sh/seu-log.txt 2>&1

5. Verificando o status manualmente
Testar o Log ONLINE : cat /home/seu-usuário/diretório/seu-log.log

A estrutura de saída deverá ser algo como 

2024-10-16 10:44:39 - Iniciando verificação do serviço Nginx
2024-10-16 10:44:39 - Serviço Nginx está online.

Testando o Log OFFLINE

Para testar esse log, devemos parar o serviço: sudo systemctl stop nginx
No arquivo de log para a validação offline teremos algo como:

2024-10-16 10:44:39 - Serviço Nginx está offline.

6. Versionamento no GitHub
   Dentro da pasta do seu projeto:
git init
git add .
git status
git commit -m "Seu comentário"
git push origin master

