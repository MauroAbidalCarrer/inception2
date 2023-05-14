#!/bin/bash
#For some reasons, if we use the CERTS_ variable directly in the conf file like for the domain, the variable does not get expanded.
#So we sed it manually.
sed -i -r "s|cert_path_placeholder|${CERTS_}|g" /etc/nginx/sites-available/default
ls -l /var/www/html/
echo -n "whoami: "
whoami
chmod 777 /var/www/html/wordpress
ls -l /var/www/html/
chown -R root:root /var/www/html/wordpress

echo ""
echo "Running nginx..."
nginx -g "daemon off;"
