FROM ubuntu:24.04 as base

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install --no-install-recommends curl git build-essential pip neovim python3-neovim python3-msgpack && \
    git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim && \
    cd ~/.vim/bundle/vimproc.vim && \
    make && \
    useradd -ms /bin/bash base && \
    rm -rf /var/lib/apt/lists/*

USER base
WORKDIR /home/base

ENTRYPOINT ["/bin/bash"]
