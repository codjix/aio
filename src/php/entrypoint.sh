#!/bin/sh

if [ ! -f /etc/php83/conf.d/custom.ini ]; then
  cat << EOF > /etc/php83/conf.d/custom.ini
max_file_uploads = 1024
upload_max_filesize = 1024M
post_max_size = 1024M
EOF
  sed -i "/LoadModule rewrite_module/s/^#//g" /etc/apache2/httpd.conf
  sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/httpd.conf
fi

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ] || { [ -f "${1}" ] && ! [ -x "${1}" ]; }; then
  set -- php -v
fi

exec "$@"