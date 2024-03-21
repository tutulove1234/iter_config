#!/bin/bash -x

function install_vundle() {
   echo "install vundle ..."
   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}

function install_dependency() {
  echo "install dependencies ..."
  sudo apt-get install vim -y
  sudo apt-get install git -y
  sudo apt-get install tmux -y
  sudo apt-get install cmake -y
  sudo apt-get install python3.10-dev -y
}

function install_config() {
  echo "install config ..."
  cp -r tmux/.tmux ~/
  cp tmux/.tmux.conf ~/
  cp tmux/.tmux.conf.local ~/
  cp vim/.vimrc ~/
}

function compile_ycm() {
   pushd ~/.vim/bundle/YouCompleteMe
   ./install.py --clang-complete
   popd
}

install_dependency
install_vundle
install_configure

echo "Finished!"

# clash url: https://github.com/doreamon-design/clash/releases
# clash configuration: http://clash.razord.top/#/proxies

