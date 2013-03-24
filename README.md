Clone repo
==========
```
$ git clone https://github.com/slashmili/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles && git submodule update --init --recursive
```


Setup vim settings
=================
```
$ ln -s ~/.dotfiles/.vim ~/.vim
$ echo "source ~/.dotfiles/.vimrc" >> ~/.vimrc
$ mkdir ~/.fonts && git clone https://github.com/scotu/ubuntu-mono-powerline ~/.fonts/ubuntu-mono-powerline
$ sudo fc-cache -fr # and then choose one of these fonts in your terminal settings 
```

Bashrc settings
===============
```
$ echo "source ~/.dotfiles/.bashrc" >> ~/.bashrc
```
