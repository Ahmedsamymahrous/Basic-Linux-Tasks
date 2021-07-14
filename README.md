# :penguin: Automated Linux Tasks
In this repo we will:
* Create a Linux CentOS machine on AWS using Terraform.
* Create Incorta user using Ansible.
* Allow Incorta user to switch to root without a password using Ansible.
* Attach external disk with ext4 format then mount it under /incorta with Incorta ownership, using Terraform
* Install all JAVA versions (OpenJDK 8 & 11, Oracle JDK8) using Ansible.
* Create a switchable bash script to switch between JAVA versions.
* Install MySQL 5.6 using Ansible.
* Use SSH tunneling to connect to MySQL.
* Write a bash script to get the CPU and Memory (Free, Utilized, and Cached) utilization five times separated by 1 minute.


## Prerequisites 
* Python 3
* Ansible 2.9.6
* Terraform >= 0.14.9
* AWS account 

## (1) Provision The Infrastructure on AWS using Terraform
```sh
terraform apply
```
Terraform code that: 
* Create CentOS 7 EC2 instance.
* Open the SSH port.
* Create EBS volume with 30 GiP.
* Attach this volume to the EC2 instance.

## (2) Configure the EC2 server using Ansible
```sh
ansible-playbook -i hosts ansible-playbook.yml --private-key /the/path/to/file.pem
```
Ansible playbook that:
* Install OpenJDK 8 & 11, Oracle JDK 8.
* Remove MariaDB (to avoid any conflicts between MariaDB & MySQL)
* Install MySQL 5.6 and start its service.
* Create "incorta" user with sudo privileges.
* Allow "incorta" user to switch to root without a password.
* Create "/incorta" directory.
* Mount the external disk under "/incorta" with ext4 format.
* Copy the shell scripts to the target host.

## (3) Use SSH tunneling to connect to MySQL
```sh
ssh -L 3306:localhost:3306 -i /the/path/to/file.pem centos@IP-ADDRESS
```

## (4) Bash script to get the CPU and Memory utilization
After clone this repo, change the file permission to be executable:
```sh
sudo chmod +x ./utilization.sh
```
Then, run the script:
```sh
./utilization.sh
```
The expected output will be like this:
```sh
-----------------------------------------------------------------
OS NAME="CentOS Linux"
-----------------------------------------------------------------
Min   CPU(%)   Free Memory(%)  Used Memory(%)  Cached Memory(%)
-----------------------------------------------------------------
1     23.32%   2.54%           80.60%          16.86%
2     23.32%   2.82%           80.58%          16.60%
3     23.32%   2.84%           80.56%          16.60%
4     23.32%   2.84%           80.56%          16.60%
5     23.32%   2.84%           80.56%          16.60%
-----------------------------------------------------------------
```
## (5) Bash script to switch between JAVA versions
You can use this command:
```sh
sudo update-alternatives --config java
```
Or use this for simplicity:
```sh
./java-switcher.sh
```

The expected output will be like this:

```sh
There are 3 programs which provide 'java'.

  Selection    Command
-----------------------------------------------
   1           java-11-openjdk.x86_64 (/usr/lib/jvm/java-11-openjdk-11.0.11.0.9-1.el7_9.x86_64/bin/java)
*+ 2           java-1.8.0-openjdk.x86_64 (/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.292.b10-1.el7_9.x86_64/jre/bin/java)
   3           /usr/java/jdk1.8.0_291-amd64/bin/java

Enter to keep the current selection[+], or type selection number: 

```

