rm $PREFIX/bin/ICmodPacker
if [ $? != 0 ]; then 
  echo "卸载失败，有可能你没有安装" 
  exit 1
fi;