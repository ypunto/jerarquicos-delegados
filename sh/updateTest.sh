# Parametros
CARPETAORIGEN="/home/adminis/repositorios/jerarquicos-delegados/src/site/"
CARPETACLIENTE="/var/www/salud/delegados"

# sync sources: agregando -n se puede ejecutar en modo dry-run para ver lo que sincronizaria antes de ejecutarlo
rsync -avzhP --delete --exclude ".git/" --exclude ".gitignore" --exclude "readme.md" ${CARPETAORIGEN} ${CARPETACLIENTE}

#correccion de permisos
sudo chown www-data:www-data ${CARPETACLIENTE}/ -R
