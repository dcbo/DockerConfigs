MARIA_ROOT_PASSWORD=very_secret_long_database_password_for_root
BACKUPDIR=FULL_PATH_TO_DIR_CONTAINING_DOCKER-COMPOSE
BACKUPFILE=nextcloud-db-backup.sql

# Backup Database
docker exec nextcloud-db /usr/bin/mysqldump -u root --password=$MARIA_ROOT_PASSWORD nextcloud > $BACKUPDIR/$BACKUPFILE
# Compress Backup 
cd /tank/crypt/docker/nextcloud/db-backup
tar cfzv $BACKUPFILE.tgz $BACKUPFILE --remove-files

# Restore
# tar xfv $BACKUPDIR/$BACKUPFILE.tgz 
# cat $BACKUPDIR/$BACKUPFILE | docker exec -i nextcloud-db /usr/bin/mysql -u root --password=root nextcloud



