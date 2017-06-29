#!/bin/bash
set -e
set -x
export DEVPI_SERVERDIR=/mnt
export DEVPI_CLIENTDIR=/tmp/devpi-client

INITIALIZE=false
if ! [[ -f $DEVPI_SERVERDIR/.serverversion ]]; then
     echo '.serverversion file does not exist, will initialize'
     INITIALIZE=true
else
     echo '.serverversion exists, will not initialize'
fi

if $INITIALIZE; then
  echo 'initializing and starting devpi server ...'
  devpi-server --init
  devpi-server --start --host 0.0.0.0 --port 3141
  devpi use http://localhost:3141
  devpi login root --password=''
  devpi user -m root password="${DEVPI_PASSWORD}"
  devpi index -y -c public pypi_whitelist='*'
else
  echo 'starting devpi server ...'
  devpi-server --start --host 0.0.0.0 --port 3141

fi
tail -f $DEVPI_SERVERDIR/.xproc/devpi-server/xprocess.log
