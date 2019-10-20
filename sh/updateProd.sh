# Parametros
CARPETA="/var/www/salud/delegados"
SERV_DESTINO="192.168.1.25"

# stop services
ssh -p 222 root@${SERV_DESTINO} "/etc/init.d/apache2 stop"
/etc/init.d/apache2 stop

# sync sources agregando n se ejecuta dry-run
rsync -e 'ssh -p 222' -avzn --delete ${CARPETA}/ root@${SERV_DESTINO}:${CARPETA}

# Permisos
ssh -p 222 root@${SERV_DESTINO} "sudo chown www-data:www-data ${CARPETA} -R"

# start services
/etc/init.d/apache2 start
ssh -p 222 root@${SERV_DESTINO} "/etc/init.d/apache2 start"
