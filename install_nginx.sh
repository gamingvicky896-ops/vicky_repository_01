#!/bin/bash
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "Nginx installed and started successfully"
