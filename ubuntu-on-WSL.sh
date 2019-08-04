#!/usr/bin/env bash

set -e

[ ! -d "$HOME/dev/term-setup" ] \
  && mkdir -pv "$HOME/dev" \
  && git clone --recurse-submodules http://github.com/eldiaboloz/term-setup-wsl.git "$HOME/dev/term-setup" \
  && $HOME/dev/term-setup/bin/create_symlinks.sh \
  && source $HOME/.profile

if [ ! -z "$1" ]; then
  grep -R "longsleep/golang-backports" /etc/apt/sources.list.d/ | grep -v "#" >/dev/null 2>&1 \
    || sudo add-apt-repository ppa:longsleep/golang-backports
  sudo -H apt-get update
  sudo -H apt-get install --no-install-recommends \
    virt-manager \
    gir1.2-spiceclientglib-2.0 \
    gir1.2-spiceclientgtk-3.0 \
    xfce4-terminal \
    zsh \
    parcellite \
    youtube-dl \
    ffmpeg \
    qalc \
    make \
    golang-go \
    gcc \
    libc-dev \
    php-cli \
    jq \
    silversearcher-ag
  ( cd $HOME/dev/term-setup/github.com/junegunn/fzf && make)
  ( cd $HOME/dev/term-setup/github.com/powerline/fonts && ./install.sh )
fi
