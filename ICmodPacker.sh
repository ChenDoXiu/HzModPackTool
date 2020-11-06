#!/bin/bash
#检测nodejs是否存在

hash node 2>/dev/null || {
  echo "检测到当前未安装nodejs，正在安装";
  apt install nodejs
}


echo -n "项目名称(默认值:ModName,不能包含空格和特殊字符，否则创建会失败)："
read NAME;
NAME=${NAME:-"ModName"};

echo -n "项目作者(默认：author)："
read AUTHOR;
AUTHOR=${AUTHOR:-"author"}

echo -n "项目版本(默认：1.0.0,必须为3个数字，否则npm无法正常安装)"
read VERSION
VERSION=${VERSION:-"1.0.0"}

echo -n "项目描述(默认：空)："
read DESC
DESC=${DESC:-" "}

echo -n "horizon包名(默认：Inner_Core_Test)："
read HZNAME
HZNAME=${HZNAME:-"Inner_Core_Test"}

#HZ目录mod文件夹地址
HZDIR="/sdcard/games/horizon/packs/"$HZNAME"/innercore/mods/";
#模组文件夹路径
MODDIR=$HZDIR$NAME

echo "当前mod创建的目录为：
"$MODDIR"


按任意键继续,按ctrl+C停止"
read _aa



#/---------------------创建临时文件夹，开始安装-----------------

TEMDIR=".ICmodTemp"
#删除上次留下的临时文件
if [ -d $TEMDIR ]; then
  rm -rf $TEMDIR 
fi

if [ -d $NAME ] || [ -f $NAME ]; then
  echo "当前目录名称已存在！"; 
  exit 1;
else
  mkdir $TEMDIR;
  cd $TEMDIR;
fi
#创建项目文件夹
mkdir assets;
mkdir assets/items-opaque;
mkdir assets/terrain-atlas;
mkdir gui;
mkdir src;
#写入配置文件
echo '{
  "resources":[
    {
      "path":"assets/",
      "resourceType":"resource"
    },
    {
      "path":"gui/",
      "resourceType":"gui"
    }
  ],
  "defaultConfig":{
    "buildType":"develop",
    "api":"CoreEngine",
    "libraryDir":"lib/",
    "setupScript":".setup"
  },
  "compile":[
    {
      "path":"bin/main.js",
      "sourceType":"mod"
    },
    {
      "path":"launcher.js",
      "sourceType":"launcher"
    }
  ]
}' > build.config

#写入modinfo

echo '{
    "name": "'$NAME'",
    "author": "'$AUTHOR'",
    "version": "'$VERSION'",
    "description": "'$DESC'"
}' > mod.info

#写入npm配置
echo '{
  "name": "'$NAME'",
  "version": "'$VERSION'",
  "description": "'$DESC'",
  "main": "src/main.js",
  "scripts": {
    "dev": "webpack --mode=production;rsync -av --exclude node_modules ./ '$MODDIR'",
    "build": "webpack --mode=production;rsync -av --exclude node_modules ./ '$MODDIR'"
  },
  "author": "'$AUTHOR'",
  "devDependencies": {
    "@babel/core": "^7.1.6",
    "@babel/preset-env": "^7.1.6",
    "babel-loader": "^8.0.4",
    "webpack": "^4.26.1",
    "webpack-cli": "^3.1.2"
  }
}' > package.json

#写入webpack配置
echo "var path = require('path');

module.exports = {
  entry: './src/main.js', 
  output: {
    path: path.resolve(__dirname, 'bin'), 
    filename: 'main.js'
  },
  module: {
  rules: [
    { 
      test: /\.js$/, 
      exclude: /(node_modules)/,
      use: {
        loader: 'babel-loader', 
      }
    }
  ] 
}
};" > webpack.config.js

#创建launcher.js

echo "Launch();" > launcher.js

#创建.setup

echo 'extractAs("'$NAME'");' > .setup

#创建eslintrc

echo '{
	"parser": "babel-eslint",v
	"parserOptions": {
		"ecmaVersion": 6
	},
	"env": {
		"browser": true,
		"node": true,
		"es6": true,
		"worker": true,
		"mocha": true
	},
	"rules": {
		"semi": [
			"error",
			"never"
		],
		"quotes": [
			"error",
			"single",
			{
				"allowTemplateLiterals": true
			}
		],
		"max-len": [
			"error", 
			{
				"code": 120
			}
		]
 	}
}' > .eslintrc

#创建babel配置

echo '{"presets": ["@babel/preset-env"]}' > .babelrc;

#创建入口文件

echo "alert('hello world')" > src/main.js

echo "正在安装库文件"
npm install
if [ $? != 0 ]; then 
  echo "库文件安装失败" 
  exit 1
fi;

cd .. 
mv $TEMDIR $NAME

echo "感谢使用！
项目创建成功
/------------------------------------
项目地址："./$NAME"
/------------------------------------
请使用 cd "./$NAME"  进入项目
使用 npm run dev 编译开发环境代码
使用 npm run build 编译生产环境代码
"
