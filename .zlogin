source ~/.profile
[ ! -z "$DISPLAY" ] && xmodmap ~/.Xmodmap 
[ -z "$SSH_AUTH_SOCK" ] && eval $(ssh-agent)
