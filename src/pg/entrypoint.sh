#!/bin/sh

/app-ci/entrypoint.sh echo ""

# Prepare software
alias pgrun="su-exec postgres"

mkcluster(){
  # define variables
  local user=$1
  local pass=$2
  local db=$3
  # check if variables are empty
  if [ -z "$user" ] || [ -z "$pass" ] || [ -z "$db" ]; then
    echo "Usage: mkcluster <username> <password> <database>"
    exit 1
  fi
  # check if user and database already exists
  if [ ! -e $PGHOME/users/$user ]; then
    if [ "$user" != "postgres" ]; then
      pgrun psql -U postgres -c "CREATE USER $user;"
      echo "created user $user"
    fi
    # set password for user
    pgrun psql -U postgres -c "ALTER USER $user WITH PASSWORD '$pass';"
    echo "set password for user $user"
    echo > $PGHOME/users/$user
  fi
  # check if database already exists
  if [ ! -e $PGHOME/db/$db ]; then
    if [ "$db" != "postgres" ]; then
      pgrun psql -U postgres -c "CREATE DATABASE $db;"
      echo "created database $db"
      pgrun psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE $db TO $user;"
      echo "granted all privileges on database $db to user $user"
    fi
    echo > $PGHOME/db/$db
  fi
}

if [ ! -d $PGDATA ]; then
  mkdir -p $PGDATA $PGHOME/users $PGHOME/db /run/postgresql
  chown -R postgres:postgres $PGDATA $PGHOME/users $PGHOME/db /run/postgresql
  pgrun initdb $PGDATA
  pgrun pg_ctl -D $PGDATA start > /dev/null
  while ! pgrun pg_isready; do
    sleep 1
  done
  mkcluster $POSTGRES_USER $POSTGRES_PASSWORD $POSTGRES_DB
  pgrun pg_ctl -D $PGDATA stop > /dev/null
fi

echo "   +------------------------+"
echo "   |   ____  ______  ___    |"
echo "   |  /    )/      \/   \   |"
echo "   | (     / __    _\    )  |"
echo "   |  \    (/ o)  ( o)   )  |"
echo "   |   \_  (_  )   \ )  /   |"
echo "   |     \  /\_/    \)_/    |"
echo '   |      \/  //|  |\\      |'
echo "   |          v |  | v      |"
echo "   |            \__/        |"
echo "   |                        |"
echo "   |  Starting PostgreSQL   |"
echo "   +------------------------+"

# Run current
if [ $# -eq 0 ]; then
  pgrun postgres
fi

# Run next
exec "$@"