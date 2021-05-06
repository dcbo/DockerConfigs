# Paperless Document management

## Introduction
This configuration

- installs Paperless ng
  - https://github.com/jonaswinkler/paperless-ng  
- uses Traefik as Reverse Proxy
- allows to set access rights
  - limit to local IPs 
  - require Client Certificates

## Preparations
- Set DNS 
  - e.g. paperless.example.com 

## Setup & Configuration
The following values must be changed to personal needs:
- copy `env-sample` to `.env` and edit values
- create directories
  - ./data    - Papeless Data & Logfiles   
  - ./media   - Papeless Document Storage  
  - ./pgdata  - PostgreSQL Database
  - ./consume - Papeless Consuption Directory 
  - ./export  - Papeless Export Directory 
- if you want to allow access to paperless from external IPs
  - remove `onlyLocal@file`from `traefik.http.routers.paperless-secure.middlewares` 
- if you want to allow access **only with client certificates** uncomment
  - `- "traefik.http.routers.paperless-secure.tls.options=requestClientCert@file"`
- start Paperless `docker-compose up -d`
      
## Knows Issues
- n/a
