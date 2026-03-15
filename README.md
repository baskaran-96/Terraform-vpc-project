# Terraform AWS VPC Project

## Overview
Production-style AWS infrastructure provisioned entirely with Terraform IaC.

## Architecture
- VPC (10.0.0.0/16)
- Public Subnet (10.0.1.0/24) — Bastion Host
- Private Subnet (10.0.2.0/24) — App Server
- Internet Gateway — public internet access
- Route Tables — public and private routing
- Security Groups — SSH restricted to admin IP only
- EC2 Bastion Host — SSH jump server (public subnet)
- EC2 App Server — Nginx web server (private subnet)

## Tech Stack
- Terraform v1.14
- AWS (VPC, EC2, Security Groups, IGW, Route Tables)
- Amazon Linux 2
- Nginx

## How to Deploy
1. Clone the repo
   git clone https://github.com/baskaran-96/Terraform-vpc-project.git
   cd Terraform-vpc-project

2. Create terraform.tfvars
   aws_region          = "us-east-1"
   project_name        = "baskaran-vpc"
   vpc_cidr            = "10.0.0.0/16"
   public_subnet_cidr  = "10.0.1.0/24"
   private_subnet_cidr = "10.0.2.0/24"
   my_ip               = "YOUR_IP/32"
   key_pair_name       = "YOUR_KEY_PAIR"
   instance_type       = "t2.micro"

3. Deploy
   terraform init
   terraform plan
   terraform apply

4. SSH into Bastion
   ssh -i ~/.ssh/your-key.pem ec2-user@BASTION_PUBLIC_IP

5. Destroy when done
   terraform destroy

## Resources Created
| Resource             | Description                       |
|----------------------|-----------------------------------|
| aws_vpc              | Main VPC                          |
| aws_subnet (public)  | Public subnet for bastion host    |
| aws_subnet (private) | Private subnet for app server     |
| aws_internet_gateway | Internet access for public subnet |
| aws_route_table      | Public routing rules              |
| aws_security_group   | SSH restricted to admin IP only   |
| aws_instance bastion | Jump server in public subnet      |
| aws_instance app     | Nginx server in private subnet    |

## Key Concepts Demonstrated
- Infrastructure as Code with Terraform
- VPC network segmentation (public vs private)
- Security group chaining
- Bastion host pattern for secure SSH access
- EC2 user data for automated software install
