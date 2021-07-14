# :penguin: Automated Linux Tasks
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

## (1) Provision The Infrastructure on AWS using Terraform
Terraform code that: 
* Create CentOS 7 EC2 instance.
* Open the SSH port.
* Create EBS volume with 30 GiP.
* Attach this volume to the EC2 instance.

## (2) Configure the EC2 server using Ansible
Ansible playbook that:
* Install OpenJDK 8 & 11, Oracle JDK 8.
* Remove MariaDB (to avoid any conflicts between MariaDB & MySQL)
* Install MySQL 5.6 and start its service.
* Create "incorta" user with sudo privileges.
* Create "/incorta" directory.
* Mount the external disk under "/incorta" with ext4 format.
* Copy the shell scripts to the target host.

