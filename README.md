## Devpi Dockerfile


This repository contains **Dockerfile** of [Devpi](http://doc.devpi.net/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/andrelouw/devpi/) published to the public [Docker Registry](https://index.docker.io/).


### Dependencies

* [dockerfile/python](http://dockerfile.github.io/#/python)


### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [trusted build](https://index.docker.io/u/scrapinghub/devpi/) from public [Docker Registry](https://index.docker.io/): `docker pull andrelouw/devpi`

   (alternatively, you can build an image from Dockerfile: `docker build -t="andrelouw/devpi" github.com/louwandre90/docker-devpi`)


### Usage

#### Run `devpi-server`

    docker run --name devpi  --publish 3141:3141  --env=DEVPI_PASSWORD=password --volume devpi:/mnt --restart always andrelouw/devpi

Devpi creates a user named `root` by default, its password can be set with
`DEVPI_PASSWORD` environment variable.
