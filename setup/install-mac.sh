#!/bin/sh

main() {

 echo "install oh-my-zsh first.."
 sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

 echo "setting up .zshrc file.."
 curl -o ~/.zshrc https://raw.githubusercontent.com/virtubill/dotties/main/.zshrc

 echo "setting up brew.."
 sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

 echo "setting up vim.."
 brew install vim

 mv ~/.vimrc ~/.backup_vimrc
 curl -o ~/.vimrc https://raw.githubusercontent.com/virtubill/dotties/main/.vimrc

 if [ ! -d ~/.vim/bundle/Vundle.vim/ ]
  then
    mkdir -p ~/.vim/bundle/Vundle.vim/
 fi
 
 git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
 vim -c "execute \"PluginInstall\" | qa"

 echo "setting up tig.."
 brew install tig

 echo "setting up brave browser.."
 brew install --cask brave-browser

 echo "setting up rectangle.."
 brew install --cask rectangle

 echo "setting up android studio.."
 brew install --cask android-studio

 echo "setting up intellij.."
 brew install --cask intellij-idea

 echo "setting up node.."
 brew install node

 echo "setting up for react-native.."
 brew install watchman
 sudo gem install cocapodsbrew install watchman
 
 echo "setting up for slack.."
 brew install --cask slack

 # TODO: install xcode
}


main "$@"
