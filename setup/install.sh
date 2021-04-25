#!/bin/sh

main() {
 echo "downloading dottie files.."
 mkdir ~/.dotties
 git clone git@github.com:virtubill/dotties.git ~/.dotties

 echo "setting up .zshrc file.."
 mv ~/.bashrc ~/.bakup_bashrcc
 cp ~/.dotties/.bashrc ~/.bashrc

 echo "setting up git script.."
 curl -o ~/.dotties/scripts/git-prompt.sh https://raw.githubusercontent.com/git/git/contrib/completion/git-prompt.sh

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

 echo "setting up brave browser.."
 install brave
}

install() {
if [ -x "$(command -v apt-get)" ]; then sudo apt-get install $1
elif [ -x "$(command -v pacman)" ]; then sudo pacman -S $1
elif [ -x "$(command -v yum)" ]; then sudo yum $1
else echo "FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install: $1">&2; fi
}

main "$@"
