# Parametros
CARPETA="/var/www/salud/delegados"
SERV_ORIGEN="192.168.1.26"

# stop services
ssh -p 222 root@${SERV_ORIGEN} "/etc/init.d/apache2 stop"
/etc/init.d/apache2 stop

# sync sources agregando n se ejecuta dry-run
rsync -e 'ssh -p 222' -avzn --delete root@${SERV_ORIGEN}:${CARPETA}/ ${CARPETA}

# Permisos
chown www-data:www-data ${CARPETA} -R

# start services
ssh -p 222 root@${SERV_ORIGEN} "/etc/init.d/apache2 start"
/etc/init.d/apache2 start
