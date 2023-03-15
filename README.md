# golang-ubuntu-docker
Dockerfile de uma imagem ubuntu que executa a linguagem Golang

Link do Docker Hub: https://hub.docker.com/repository/docker/peeliima/ubuntu-golang/general

#### Problemas

A imagem builada passas pela seguinte etapa: 

RUN echo $PATH
RUN echo "export GOPATH=$HOME/go" >> ~/.bashrc
RUN echo "export PATH=$PATH:$GOPATH/bin" >> ~/.bashrc
RUN echo "export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin" >> ~/.bashrc
RUN . ~/.bashrc
RUN echo $PATH
RUN cat ~/.bashrc

O comando RUN . ~/.bashrc deveria da um source do arquivo bashrc para atualizar ele e o $PATH do binário do Golang se reconhecido pelo SO,
porem no momento do build como o docker monta a imagem utilizando varios containers de apoio o bashrc é atualizado em um deles e não ná imagem final
isso gera o problema de que toda vez que a imagem é iniciada deve-se executar ela `docker exec -it nome_da_imagem bash` e dentro da imagem executar o comando
`. ~/.bashrc`, ai a imágem começa a reconhecer o binário do golang.