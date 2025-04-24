#!/bin/sh

. /app-ci/entrypoint.sh echo ""

# Prepare software
if [ ! -d /run/mysqld ]; then
  mkdir -p /run/mysqld
  chown -R mysql:mysql /run/mysqld
fi
prepare_log=/var/lib/mysql/mysql-prepared.log
if [ ! -f $prepare_log ]; then
  mysql_install_db --user=mysql --ldata=/var/lib/mysql > $prepare_log 2>&1
  tfile=$(mktemp)
  cat << EOF > $tfile
USE mysql ;
FLUSH PRIVILEGES ;
GRANT ALL ON *.* TO 'root'@'%' identified by "${MYSQL_ROOT_PASSWORD}" WITH GRANT OPTION ;
GRANT ALL ON *.* TO 'root'@'localhost' identified by "$MYSQL_ROOT_PASSWORD" WITH GRANT OPTION ;
SET PASSWORD FOR 'root'@'localhost'=PASSWORD("${MYSQL_ROOT_PASSWORD}") ;
# Remove the default 'test' database for security purposes as it is not needed.
DROP DATABASE IF EXISTS test ;
FLUSH PRIVILEGES ;
EOF
  mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < $tfile >> $prepare_log 2>&1
  rm -f $tfile
fi

# Run current
if [ $# -eq 0 ]; then
  su-exec mysql mysqld --user=mysql --console --skip-name-resolve --skip-networking=0
fi

# Run next
exec "$@"