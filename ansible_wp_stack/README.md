Role Name
=========

WordPress Ansible Deploy

Using this role you will be able to install:

 - MySQL DB (databases version 8.0)
 - nginx server with listening 80 port
 - wordpress site (wordpress data will be stored in default /var/www directory)

Requirements
------------

 The Role deployed on Ububtu 18.04 (in default aws vpc), with ansible 2.9.10.

Role Variables
--------------

-   wp_version         - define wordpress version to download 
-   php_version:       - define php-fpm version to install 
-   wp_db_host_ip      - define private ip address in wp-config.php 
-   db_name            - define mysql database name for wordpress 
-   db_user            - define mysql user name for wordpress
-   db_pass            - define mysql password for db_user
-   db_user_host       - specify any valid host for db_name
-   frontend           - nginx is using to define a port for listening 


Dependencies
------------

There are no any dependencies you need to worry about

Run
----------------
Before you run wp_deploy.yml need to set: wp_db_host_ip (private ip of database), and set ansible_hosts ip.
For wordpress deployment role just run wp_deploy.yml playbook. 


License
-------

BSD-3-Clause (default)

Author Information
------------------

Oleksandr Kyktenko 
