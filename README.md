# DockerConfigs
My personal Docker Configuration
## Traefik
- Reverse-Proxy for all Docker-Services
- Gets Lets-Encrypt Wildcard-Certificates 
  - for any Domian, using Netcup DNS-API (access to at least one Domain hosted at Netcup is required)
- Access Controll for each Sewrvice configurable
  - block external IPs 
  - Request Client-Certificates
## Paperless
- Document management

## ToDo
### Portainer (Docker Gui)
### CA (creating Client-Certificates)
### Dokuwiki (Internal Dokumentation)
### Duplikati (Backup)
### IoT (NodeRed, InfluxDb, MQTT-Broker)
### Nextcloud
### Samba (internal Fileserver)
