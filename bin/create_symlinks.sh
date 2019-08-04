#!/bin/bash
# where is project cloned
reporoot=${1:-"$HOME/dev/term-setup"}
dirs=(\
    "$HOME/.config/xfce4/terminal" \
    "$HOME/.config/htop" \
    "$HOME/.config/parcellite" \
    "$HOME/.vim/bundle" \
)

links=(\
    "/.Xmodmap" "$HOME/.Xmodmap" \
    "/.vimrc" "$HOME/.vimrc" \
    "/.xfce4_terminalrc" "$HOME/.config/xfce4/terminal/terminalrc" \
    "/.parcelliterc" "$HOME/.config/parcellite/parcelliterc" \
    "/.htoprc" "$HOME/.config/htop/htoprc" \
    "/.tmux.conf" "$HOME/.tmux.conf" \
    "/.zlogin" "$HOME/.zlogin" \
    "/.zlogout" "$HOME/.zlogout" \
    "/.common_zshrc" "$HOME/.zshrc" \
    "/.common_profile" "$HOME/.profile" \
    "/github.com/VundleVim/Vundle.vim" "$HOME/.vim/bundle/Vundle.vim" \
    "/github.com/robbyrussell/oh-my-zsh" "$HOME/.oh-my-zsh" \
)

dcnt="${#dirs[@]}"
for (( i=0; i<$dcnt; i+=1 )); do
  target="${dirs[$i]}"
  mkdir -v -p "$target"
done
# .profile already exists !
mv $HOME/.profile $HOME/.profile.bup
lcnt="${#links[@]}"
for (( i=0; i<$lcnt; i+=2 )); do
  source="$reporoot${links[$i]}"
  target="${links[$i+1]}"
  if [ -e "$source" ]; then
    if [ ! -e "$target" ]; then
      ln -v -s "$source" "$target"
    fi
  else
    echo "$source does not exist"
  fi
done
