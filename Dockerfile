FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y install nano
RUN apt-get -y install curl
RUN cd ~
RUN curl -O https://dl.google.com/go/go1.12.1.linux-amd64.tar.gz
RUN sha256sum go1.12.1.linux-amd64.tar.gz
RUN tar -xvf go1.12.1.linux-amd64.tar.gz -C /usr/local
RUN chown -R root:root /usr/local/go
RUN echo $PATH
RUN echo "export GOPATH=$HOME/go" >> ~/.bashrc
RUN echo "export PATH=$PATH:$GOPATH/bin" >> ~/.bashrc
RUN echo "export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin" >> ~/.bashrc
RUN . ~/.bashrc
RUN echo $PATH
RUN cat ~/.bashrc

WORKDIR /go/src
COPY . /go/src

EXPOSE 80