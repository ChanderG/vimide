FROM golang:latest
MAINTAINER Chander G <chanderg@chandergovind.org>

RUN apt-get update && apt-get -y install vim-nox 

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ADD .vimrc /root/

RUN cd ~ && vim +PluginInstall +qall

RUN cd ~ && vim +GoInstallBinaries +qall

ENV GOPATH=/gopath:$GOPATH
