## Postgresql master-slave loadbalanced cluster

### Introduction
This is a simple setup of one master and two slaves postgresql instances load balanced using HAProxy.

### Tech Stack
1. Google Cloud Platform
2. Terraform
3. Packer
4. Ansible

 ### Project directory structure
 The project is divided into two directories each holding separate components needed to setup the project.
 ```
 project directory
 | README.md
 |_packer
 |_terraform
 ```
* packer: Contains packer and ansible scripts to use when provisioning machine images used when deploying the instances.
* terraform: contains scripts needed to set up the instances in the default VPC on the Google Cloud Platform

### How to deploy to GCP

### Building the machine images
Inside the packer navigate to each of the folders and update the `vars.yml` files appropriately.
Then with packer installed on your local development machine run
```
$ packer build packer.json
```
Do this while at the root of etcd and haproxy, while for postgresql do this inside each of the sub directories.
This runs packer which in turn will run ansible and the images will be provisioned and pushed to Google cloud platform.

### Building the instances
Inside the terraform directory upadate variables.tf accordingly and also update the provider section of `main.tf`
Initialise terraform using 
```
terraform init
```
Then run 
```
terraform plan
```
to see the effect of applying the terraform script before hand, if all is good apply the terraform scripts using:
```
terraform apply
```

### Testing
Visit the public IP address of the `HAProxy` server at port 7000 to view the statistics page, confirm the master is highlted green and the others are red. In mycase `34.73.100.217:7000`
For connections to the postgresql for a client or application use the same IP address but on port `34.73.100.217:5000`

