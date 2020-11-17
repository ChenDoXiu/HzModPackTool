[返回上级](readme.md)

# 目录
- <a href="#1">termux配置</a>
- <a href="#2">vim配置</a>



# <span id="1">termux 配置教程</span>

本教程将会快速配置好一个termux环境用于Horizon模组开发
本教程包括：
配置软件源、安装开发常用的软件、配置zsh命令行环境、vim的安装配置

## 更新软件源

```
pkg update
```

## 下载常用的工具

```
pkg install curl wget git -y
```

## 安装zsh

由于国际速度缓慢，本教程使用的是国内大佬“国光”的镜像进行安装

```
sh -c "$(curl -fsSL https://html.sqlsec.com/termux-install.sh)"
```

安装完毕之后，输入

```
exit
```

进行重启

## 安装proot获得虚拟的root环境

当你切换目录到根目录时（cd /），输入ls，你会发现目录是空的
之所以是空的，实际上，当使用cd /时切换到的并不是termux的根目录
而是手机的根目录，而正常情况下，没有root权限，是不允许访问根目录的

利用proot可以为手机没有root的用户来模拟一个root的环境，这里主要是经典的 Linux 文件系统布局上的模拟。

```
pkg install proot -y
```

安装完成后输入

```
termux-chroot
```

即可得到一个虚拟的root权限，可以用于访问termux的根目录

## 安装tsu获得真实的root权限（仅限手机获取root的用户）

安装tsu，这是一个su的 Termux 版本，是一个真正的root权限，用来在termux上替代su，操作不慎可能对手机有安全风险。因为官方封装了，所以安装也很简单：

```
apt install tsu
```

然后使用

```
tsu
```

即可获得真实的root权限

# <span id="2">vim的插件安装与配置</span>

为了使vim的配置能够做到开箱即用，避免不必要的配置，我已经将常用的配置保存成一个配置文件“vimrc”，只需要简单的几个命令，就可以使用这套配置

## 安装Vim-plug

首先，我们需要安装vim-plug
Vim-plug是一个用来管理vim插件的管理器，通过安装这个我们可以快速安装齐开发HZ mod所需要的插件
使用以下命令安装Vim-plug

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

**注意：由于github的部分服务器地址在国内遭到DNS污染，如果出现无法下载的情况，请自备科学工具**

## 复制vimrc配置

vim的默认配置文件为存放在用户目录下的.vimrc中，所以我们需要拷贝这个文件到指定位置

```
cp ./vimrc ~/.vimrc
```

## 安装所需的插件

输入 “vim” 命令 进入vim中

输入“esc”进入命令模式

在命令模式下输入

```
:PlugInstall
```

等待插件安装完成

## 安装tsserver插件

本配置使用的是coc-vim进行mod开发，所以需要使用coc-vim 安装 tsserver，用来得到JavaScript的补全功能

vim 进入命令模式输入

```
:CocInstall coc-tsserver
```

## 安装coc-snippets

安装coc-snippets用于获得代码片段的支持

```
:CocInstall coc-snippets
```
# vim的使用

由于vim的教程网上遍地都是，这里不会讲述vim的基本使用

注意：以下的功能仅针对本项目提供的`vimrc`进行的

### 树状目录

在vim命令模式下按`ctrl+n`即可弹出树状目录，接着按`m`，即可弹出文件的菜单，可对文件进行操作

### 代码注释
- `<leader>c<space>` 注释/取消注
- `<leader>cc` // 注释
- `<leader>cm` 只用一组符号注释
- `<leader>cA` 在行尾添加注释
- `<leader>c$` /* 注释 */
- `<leader>cs` /* 块注释 */
- `<leader>cy` 注释并复制
- `<leader>ca` 切换　// 和 /* */
- `<leader>cu` 取消注释