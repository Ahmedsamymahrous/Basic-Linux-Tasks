# Basic Automated Linux Tasks
In this repo we will:
* Create a Linux CentOS machine on AWS using Terraform.
* Create Incorta user using Ansible.
* Attach external disk with ext4 format then mount it under /incorta with Incorta ownership, using Terraform
* Install all JAVA versions (OpenJDK 8 & 11, Oracle JDK8) using Ansible.
* Create a switchable bash script to switch between JAVA versions.
* Install MySQL 5.6 using Ansible.
* Use SSH tunneling to connect to MySQL.
* Write a bash script to get the CPU and Memory (Free, Utilized, and Cached) utilization five times separated by 1 minute.


## Prerequisites 
* Python 3. 
* Ansible 2.9.6
* Terraform >= 0.14.9
