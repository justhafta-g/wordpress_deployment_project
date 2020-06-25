#passing credentials and seting region, 
#use environment variables to pass aws access_key, secret_key https://www.terraform.io/docs/providers/aws/index.html

provider "aws" {}

#creating ec2 instance for NGINX+php-fpm(7.4)+wp
resource "aws_instance" "ec2_wp" {
    ami           = "ami-0e342d72b12109f91"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.project-wp-nginx-in.id]
    key_name = "ansible-ssh"
    user_data = <<EDF

#!/bin/bash
apt -y update && apt -y upgrade
EDF
  
    tags = {
      Name = "ec2_wp"
  }  
}
#creating ec2 instance for MySQL8
resource "aws_instance" "ec2_mysql" {
    ami           = "ami-0e342d72b12109f91"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.project-wp-mysql-in.id]
    key_name = "ansible-ssh"
    user_data = <<EDF

#!/bin/bash
apt -y update && apt -y upgrade
EDF
  
    tags = {
      Name = "ec2_mysql"
  }  
}
#creating security group to allow SSH, HTTP, HTTPS
resource "aws_security_group" "project-wp-nginx-in" {
  name        = "project-wp-nginx-in"
  description = "Allow SSH, HTTP, HTTPS inbound traffic"

  ingress {
    description = "allow SSH from myip"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["213.110.154.10/32"]
  }
  ingress {
    description = "allow HTTP from any"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }  
  ingress {
    description = "allow HTTPS from any"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow ssh-http-https in"
  }
}

#creating security group to allow SSH, MySQL
resource "aws_security_group" "project-wp-mysql-in" {
  name        = "project-wp-mysql-in"
  description = "Allow SSH, MySQL inbound traffic"

  ingress {
    description = "allow SSH from myip"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["213.110.154.10/32"]
  }
  ingress {
    description = "allow from ec2_wp"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.project-wp-nginx-in.id]
   }  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow ssh-mysql in"
  }
}