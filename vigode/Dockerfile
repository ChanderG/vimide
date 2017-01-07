FROM golang:latest
MAINTAINER Chander G <chanderg@chandergovind.org>

RUN apt-get update && apt-get -y install vim-nox

RUN mkdir ~/.vim \
    && mkdir ~/.vim/autoload \
    && mkdir ~/.vim/bundle \
    && cd ~/.vim/autoload/ \
    && wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ADD .vimrc /root/

RUN cd ~ && vim +PlugInstall +qall

RUN cd ~ && vim +GoInstallBinaries +qall

ENV GOPATH=/gopath:$GOPATH PATH=$PATH:/gopath/bin GOBIN=/gopath/bin
