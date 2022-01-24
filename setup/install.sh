#!/usr/bin/env bash

main() {
 echo "install oh my bash.."
 bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
 
 echo "setting up .zshrc file.."
 mv ~/.bashrc ~/.bakup_bashrc
 curl -o ~/.bashrc https://raw.githubusercontent.com/virtubill/dotties/main/.bashrc

 echo "setting up vim.."
 install vim

 mv ~/.vimrc ~/.backup_vimrc
 cp ~/.dotties/.vimrc ~/.vimrc

 if [ ! -d ~/.vim/bundle/Vundle.vim/ ]
  then
    mkdir -p ~/.vim/bundle/Vundle.vim/
 fi
 
 git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
 vim -c "execute \"PluginInstall\" | qa"

 echo "setiing up tig.."
 install tig

// echo "setting up brave browser.."
// install brave
// }

install() {
if [ -x "$(command -v apt-get)" ]; then sudo apt-get install $1
elif [ -x "$(command -v pacman)" ]; then sudo pacman -S $1
elif [ -x "$(command -v yum)" ]; then sudo yum $1
else echo "FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install: $1">&2; fi
}

main "$@"
