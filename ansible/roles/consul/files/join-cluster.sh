#!/bin/bash

#Waiting for Consul agent to start...
until nc -z localhost 8400; do
  sleep 10
done

#Joining the Consul cluster...
consul join $CONSUL_SERVER_IP
