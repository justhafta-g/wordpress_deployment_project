Description
=========

Deployment 2 security groups and two ec2 instances in default VPC. 

Before using main.tf need to install Terraform: [terraform instalation](https://learn.hashicorp.com/terraform/getting-started/install.html)

Requirements
------------

Need to set environment variables for using main.tf

Role Variables
--------------
Sample:

- $ export AWS_ACCESS_KEY_ID="anaccesskey"
- $ export AWS_SECRET_ACCESS_KEY="asecretkey"
- $ export AWS_DEFAULT_REGION="us-west-2"


Run
----------------

- $ terraform init  - download plagins
- $ terraform plan  - launch a plan to see what actions will be performed
- $ terraform apply - directly creating the resources described in main.tf 

License
-------

BSD-3-Clause (default)

Author Information
------------------

Sample provisioning role created by Oleksandr Kyktenko. 
