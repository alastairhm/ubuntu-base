FROM ubuntu:23.10 as base

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade && apt-get -y install --no-install-recommends curl git build-essential pip neovim && \
    git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim && \
    cd ~/.vim/bundle/vimproc.vim && \
    make && \
    pip3 install --no-cache-dir --upgrade msgpack neovim && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]

