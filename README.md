# dotfiles

## Init a dotfiles repository
- git init --bare $HOME/.dotfiles
## Define an alias of git to manage dotfiles
- alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
## Clone dotfiles repository into a new machine
- git clone --bare https://github.com/USERNAME/dotfiles.git $HOME/.dotfiles

