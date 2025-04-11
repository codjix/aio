#!/bin/sh

if [ ! -e /app-ci/mysql-root-pw.txt ]; then
  mkdir -p /run/mysqld /var/lib/mysql
  chown -R mysql:mysql /run/mysqld /var/lib/mysql

  mysql_install_db --user=mysql --ldata=/var/lib/mysql > /dev/null
  MYSQL_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD:-$(pwgen 16 1)}"
  echo $MYSQL_ROOT_PASSWORD > /app-ci/mysql-root-pw.txt
  tfile=`mktemp`

  cat << EOF > $tfile
USE mysql ;
FLUSH PRIVILEGES ;
GRANT ALL ON *.* TO 'root'@'%' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
GRANT ALL ON *.* TO 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}') ;
DROP DATABASE IF EXISTS test ;
FLUSH PRIVILEGES ;
EOF
  mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < $tfile
  killall mysqld
  rm -f $tfile
fi

mysqld --user=mysql --console --skip-name-resolve --skip-networking=0
