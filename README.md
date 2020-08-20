# vimrc
Yet another vimrc

# Feature

1. Settings working in both Linux and Windows
2. Default by convention
	- ctrl-c for copy, ctrl-v for paste
	- incremental search
	- bracket matching by %
	- trims ending white space
	- F5 for refresh
3. Minimal UI with toolbar, menu disabled (Please refer guioptions to enable it)
4. Default plugins installed e.g. quick filter (Quich-Filter)
5. Divided into different sections


# Prerequisite

### 1. Git

```sh
sudo apt-get install git
```

### 2. curl
```sh 
sudo apt-get install curl 
```

### 3. vim-plug

Vim plugins are installed by vim-plug
https://github.com/junegunn/vim-plug

#### Linux

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
``` 

#### Windows

Download plug.vim and put it in the "autoload" directory. 

# Installation

### Linux

```
wget https://raw.githubusercontent.com/ychclone/vimrc/master/.vimrc -O ~/.vimrc
```

or

Download vimrc, copy to home directory and rename to .vimrc

### Windows
Download vimrc, copy to "Program Files (x86)\Vim" and rename to _vimrc 

## Plugins Installatoin
Open vim and run:

```vim
:PlugInstall
```

# Optional

## Map Caplock key as Escape

### Linux

```sh 
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
```

### Windows

For current user, please run capLockToESC_currentUser.reg 

For local machine, please run capLockToESC_localMachine.reg



