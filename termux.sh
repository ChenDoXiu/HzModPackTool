#!/bin/bash

pkg update
#下载常用工具
pkg install vim-python curl wget git tree -y

#安装zsh主题
sh -c "$(curl -fsSL https://html.sqlsec.com/termux-install.sh)"

#安装proot
pkg install proot -y

#安装vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#复制vimrc配置
cp ./vimrc ~/.vimrc

echo "
自动的步骤已经完成
但还有一些步骤需要您手动完成：
"