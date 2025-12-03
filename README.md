Clone repo
==========
```
$ git clone https://github.com/slashmili/dotfiles.git ~/.dotfiles
```


Settings
=================
```
$ chsh -s "$(command -v fish)"
$ git submodule update --init --recursive
$ ln -s ~/.dotfiles/.config/nvim ~/.config/
$ ln -s ~/.dotfiles/.config/alacritty ~/.config/
```

Packages
=========
```
$ brew install rg
```
