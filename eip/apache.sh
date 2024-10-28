#!/bin/bash
yum update -y
yum install - y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello world from $(hostname -f). Done via Terraform!</h1>" > /var/www/html/index.html