#! /bin/bash

echo 'setting up .bashrc...'

cat << EOF > ~/.bashrc

# setup emacs to use the client model
alias emacs='emacsclient -nw --alternate-editor=""'
alias emacsgui='emacsclient --create-frame --alternate-editor=""'

#  use emacs as the main editor
export EDITOR="emacs -nw"
EOF

cat <<EOF >> ~/.bashrc

# move the go config path
export GOPATH=~/.go
EOF


echo 'done setting up .bashrc!'
