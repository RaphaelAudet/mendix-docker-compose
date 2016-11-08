# Dockerfile
#
# VERSION               0.1

FROM nginx
MAINTAINER Mendix Smart connectors <smartconnectors@mendix.com>

RUN apt-get update && apt-get install ssl-cert && apt-get clean

COPY nginx.conf /etc/nginx/conf.d/default.conf
