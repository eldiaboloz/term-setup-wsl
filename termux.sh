#!/usr/bin/env bash

set -e

[ ! -d "$HOME/dev/term-setup" ] \
  && mkdir -pv "$HOME/dev" \
  && git clone --recurse-submodules http://github.com/eldiaboloz/term-setup-wsl.git "$HOME/dev/term-setup" \
  && $HOME/dev/term-setup/bin/create_symlinks.sh \
  && source $HOME/.profile \
  && NEED_UPDATE=y

if [ ! -z "${NEED_UPDATE}" ]; then
  apt-get update
  apt-get install \
    git \
    vim \
    zsh \
    qalc \
    jq \
    fzf \
    rsync
  ( cd $HOME/dev/term-setup/github.com/powerline/fonts && ./install.sh )
fi
export DISPLAY=:0
exec -- "$@"
