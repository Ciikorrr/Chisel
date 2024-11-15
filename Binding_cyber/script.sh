#!/bin/bash

read -p "Enter the IP address: " IP_ADDRESS

for PORT in {1..100}; do
  nc -nv $IP_ADDRESS $PORT
done
