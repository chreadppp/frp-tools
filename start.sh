#!/bin/bash


configFile() {
		
	sed -i "s#$1#$2#g" BOOT-INF/classes/config/application.yml
	echo "配置$1为: $2..."

}


initConfig(){

configFile SERVER_PORT $SERVER_PORT 8899

configFile MYSQL_HOST $MYSQL_HOST mysql

configFile MYSQL_PORT $MYSQL_PORT 3306

configFile MYSQL_DB $MYSQL_DB frp

configFile MYSQL_USER $MYSQL_USER frp

configFile MYSQL_PASSWD $MYSQL_PASSWD 123456

}

if [ -f "BOOT-INF/classes/config/application.yml" ];then
  initConfig
  jar uf frp.jar BOOT-INF/classes/config/application.yml 
  rm -rf BOOT-INF
  echo "初始化配置文件完成。"
fi

java -Dloader.path=./lib -jar frp.jar
