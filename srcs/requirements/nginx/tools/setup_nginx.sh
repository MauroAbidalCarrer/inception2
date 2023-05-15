#!/bin/bash
#For some reasons, if we use the CERTS_ variable directly in the conf file like for the domain, the variable does not get expanded.
#So we sed it manually.
sed -i -r "s|cert_path_placeholder|${CERTS_}|g" /etc/nginx/sites-available/default
sed -i -r "s|DOMAIN_NAME|${DOMAIN_NAME}|g" /etc/nginx/sites-available/default
echo "nginx conf file after sed modifs:"
cat /etc/nginx/sites-available/default
echo -n "whoami: "
whoami
chmod 777 /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress
#ls -lR /var/www/html/

echo ""
echo "Running nginx..."
exec nginx -g "daemon off;"
