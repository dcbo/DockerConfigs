# Traefik Reverse-Proxy

## Introduction
This configuration

- gets Wildcard Certificates from Lets-Encrypt 
  - for any Domian (DNS hat not to be hosted at Netcup) 
  - using Netcup DNS-API (at least on Domain must be hosted at Netcup) 
- redirects all HTTP-Trafic to HTTPS
- acts as Reverse-Proxy for all my Services
- **blocks external IPs** for internal servicesw
- allows access only with **Client-Certificates** specific services

## Preparations
- Set DNS for all needed Services to Docker-Host
  - e.g. *.example.com CNAME my.dnydns.example.com
- If your Domain *example.com* is not hostet @ NETCUP set the folowing DNS-CNAME entry:
  - `_acme-challenge.example.com CNAME acme.validation.netcuphosted.com`
     where
     - `example.com` is a domain hosted from DNS without API
     - `netcuphosted.com` is a domain hosted by Netcup-Nameserver with DNS-API

## Setup & Configuration
The following values must be changed to personal needs:
- copy `env-sample` to `.env` and edit values
- in `data/traefik.yml`
  - disable / add entryPoints you need (e.g. mqtt)
  - set your `E-Mail certificatesResolvers / dns / acme / email`
  - due to setup and testing witch to Staging-CA `certificatesResolvers / dns / acme / caServer`
- in `dynamic_conf.yml`
  - disable `requestClientCert` Option if Client-Certificates are not needed
  - in middleware `onlyLocal` set you loacl IP-Ranges
- create empty acme.json 
  - `touch data/acme.json`
  - `chmod 600 data/acme.json`
- If you use Client-Cerificates store your public Client-CA Certificate in `data/client-ca.crt`
  - `chmod 600 acme.json`
- Create Docker Network `docker network create proxy`
- start Traefik `docker-compose up -d`
      
## Knows Issues
- Hairpin NAT 
  - If access to services from local clients is not possible, it might bei an DNS and NAT issue see https://wiki.mikrotik.com/wiki/Hairpin_NAT
  - be sure, that local clients get the local IP and not your Internet IP
