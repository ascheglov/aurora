#!/usr/bin/env bash

LOCKBOX_SECRET=e6q931dt7ecmhjgimsvo
${TF_BIN:-terraform} init \
  -backend-config="access_key=$(yc lockbox payload get $LOCKBOX_SECRET --key=access_key)" \
  -backend-config="secret_key=$(yc lockbox payload get $LOCKBOX_SECRET --key=secret_key)" \
  "$@"
