variable "aws_region" {
    default = "us-east-1"
}

variable "project_name" {
  default = "baskaran-vpc"
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"  
}

variable "public_subnet_cidr" {
    default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
    default = "10.0.2.0/24"
}

variable "my_ip" {
    description = "68.43.32.63/32"
  
}

variable "key_pair_name" {
    description = "Your AWS key pair name for SSH"
}

variable "instance_type" {
    default = "t2.micro"
}

