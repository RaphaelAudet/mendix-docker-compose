# Docker Compose for Mendix Application

## Scope

Run a mendix app (mda), quickly with trial license. This can help you develop and
test.
You will need to create admin users with m2ee-tools.
It isn't advised to run this in production with the current
setup (you may want to consider setting up end endpoints, ssl certificates,
    blue-green deployments, history of deployments, high availability, monitoring,
    logging, alerts, credentials management, backups, security checks...)


## Setup

This will start 3 containers:
* nginx container for https resolution (with snakeoil certificates)
* a mendix container connected to the database containers, this container
requires an application "application.mda" to be provided
* a postgres database container

## Requirements

* the container will need to be able to reach Internet
* you need the mda of the application and the configuration
* docker and the ability to run a Makefile

## Use

1. put your application mda in the mendix-docker-compose folder, name it application.mda
1. put your application configuration in the mendix-docker-compose, name it m2ee.yaml
1. build your containers with ~make build`
1. start your docker-compose

example:
```
git clone https://github.com/RaphaelAudet/mendix-docker-compose.git
cd mendix-docker-compose
wget https://cdn.mendix.com/sample/sample-690.mda -O application.mda
wget https://cdn.mendix.com/sample/m2ee.compose.test.yaml  -O  m2ee.yaml
make build
docker-compose up
```

## Contribute

This project is under development
Contributions are welcomed
