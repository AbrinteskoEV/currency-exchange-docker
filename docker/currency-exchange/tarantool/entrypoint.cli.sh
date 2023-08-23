#!/bin/bash

su root --command "sudo chown tarantool:tarantool /usr/share/tarantool/currency-exchange"

ssh-keyscan github.com >> ~/.ssh/known_hosts
git clone git@github.com:AbrinteskoEV/currency-exchange-tarantool.git/ .

TARANTOOL_WORKDIR=/var/lib/tarantool/currency-exchange.${TARANTOOL_INSTANCE_NAME:-default}
TARANTOOL_PID_FILE=/var/run/tarantool/currency-exchange.${TARANTOOL_INSTANCE_NAME:-default}.pid
TARANTOOL_CONSOLE_SOCK=/var/run/tarantool/currency-exchange.${TARANTOOL_INSTANCE_NAME:-default}.control

cartridge build
cartridge start -d
cartridge replicasets setup --bootstrap-vshard

curl -v "localhost:8081/admin/config" -X PUT --data-binary @config.yml

sleep infinity
