# 一个基于termux简易的HZ mod一键环境搭建脚本


关于termux环境的搭建和vim编辑器的安装，请看这里 [termux与vim的安装与配置](termux.md)

## 介绍

此工具用于在安卓Termux环境下搭建一套基于vim编辑器的一键式开发环境

支持一键创建Horizon项目，并且可以一键导入到horizon游戏中

支持补全horizon的所有函数(需要d.ts文件支持)

使用webpack 和babel编译，使其支持完整es6语法，包括pack包机制

直接使用npm安装库（或许吧）

**注意：本脚本仅适用于termux**


## 安装 

安装git

```
apt install git
```
克隆这个库

```
cd #回到主目录
git clone https://github.com/ChenDoXiu/HzModPackTool
```
切换到文件所在目录并安装
```
cd HzModPackTool
chmod 777 * #赋予脚本执行权限
./Install.sh
```

## 创建空项目
要创建空项目，请在安装完成之后，使用本命令
```
ICmodPacker
```
此命令会在当前所在目录创建一个项目文件夹，允许此命令之后，填入项目的信息，便会自动开始创建

## 编译代码并安装进HZ

进入上一步创建的项目文件夹，运行

```
npm run build
```
这将会使用webpack打包js文件并安装（复制）到HZ的mods目录，当打包完成后，再进入horizon即可完成加载此mod

## 卸载 

进入从github克隆下来的目录, 然后执行./UnInstall.sh
```
cd HzModPackTool
./UnInstall.sh
```

## 获取补全提示

**注意：以下仅适用于本项目提供的vim配置文件 如果没有安装好vim以及所需的插件，请参考本项目的vim搭建教程**

在安装好vim和vim的插件之后，vim已经具备补全的能力了，但要正确的提示HzMod的API，我们需要导入HZ官方提供的d.ts文件

导入的方法很简单，去官方的工具链仓库下载一份，放进项目里即可

官方的工具链地址：https://github.com/zheka2304/innercore-mod-toolchain/tree/master/toolchain-mod/toolchain/declarations

如果只是需要得到HZ API的提示，仅需要下载`core-engine.d.ts`文件即可

如果嫌麻烦的话，本项目已经复制了一份d.ts文件，你直接复制到项目里去就行了
