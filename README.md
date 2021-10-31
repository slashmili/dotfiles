Clone repo
==========
```
$ git clone https://github.com/slashmili/dotfiles.git ~/.dotfiles
```


Setup vim settings
=================
```
$ ln -s ~/.dotfiles/.vim ~/.vim
$ ln -s ~/.dotfiles/.vimrc ~/.vimrc
$ mkdir -p ~/.config/nvim
$ ln -s ~/.dotfiles/.vim/pack ~/.config/nvim/pack
$ ln -s ~/.dotfiles/.vimrc ~/.config/nvim/init.vim
$ git clone https://github.com/k-takata/minpac.git  ~/.dotfiles/.vim/pack/minpac/opt/minpac
$ vim -c "PackUpdate"
```

Bashrc settings
===============
```
$ echo "source ~/.dotfiles/.bashrc" >> ~/.bashrc
```


Packages
=========
```
$ brew install rg
```
