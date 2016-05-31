#!/bin/bash

#Exit immediately if a command exits with a non-zero status
set -e

echo "Setting hostname in /etc/hosts..."
sudo sh -c "echo \"$(hostname -I) $(hostname)\" >> /etc/hosts"

echo "Mounting attached volume..."
mkfs.ext4 /dev/vdb
mkdir /mnt/volume
mount /dev/vdb /mnt/volume

echo "Starting Spark slave..."
cd /opt/spark/default
sbin/start-slave.sh spark://${spark_master_ip}:7077