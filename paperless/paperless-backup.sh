# To Backup Paperless 
# - start this script 
# - backup content of folder ./export
# ------------------------------------------------------------
# - This Script is scheduled every day
#   - see: crontab -e
# - Backup is scheduled every day after this 
# ------------------------------------------------------------
docker-compose run --rm webserver document_exporter /export
cp .env ./export/.env
cp docker-compose.yml ./export/docker-compose.yml
cp paperless-backup.sh ./export/paperless-backup.sh
