#!/usr/bin/env bash

set -e

[ ! -d "$HOME/dev/term-setup" ] \
  && mkdir -pv "$HOME/dev" \
  && git clone --recurse-submodules http://github.com/eldiaboloz/term-setup-wsl.git "$HOME/dev/term-setup" \
  && $HOME/dev/term-setup/bin/create_symlinks.sh \
  && source $HOME/.profile \
  && NEED_UPDATE=y

if [ ! -z "${NEED_UPDATE}" ]; then
  sudo -H apt-get update
  sudo -H apt-get install --no-install-recommends \
    virt-manager \
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
    x11-xserver-utils \
    x11-utils \
    x11-xkb-utils
  ( cd $HOME/dev/term-setup/github.com/junegunn/fzf && make)
  ( cd $HOME/dev/term-setup/github.com/powerline/fonts && ./install.sh )
fi
export DISPLAY="$(ip route | awk '/^default/{print $3; exit}'):0"
exec -- "$@"
