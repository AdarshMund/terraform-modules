# -------- Provider --------
variable "region" {}


# -------- VPC --------
variable "vpc_cidr" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}

variable "az_1" {}
variable "az_2" {}

variable "map_public_ip" {}

variable "public_subnet_tags" {}
variable "private_subnet_tags" {}

variable "igw_tags" {}
variable "eip_tags" {}
variable "nat_tags" {}

variable "public_rt_tags" {}
variable "private_rt_tags" {}

variable "internet_cidr" {}

variable "sg_name" {}
variable "sg_description" {}
variable "sg_tags" {}

variable "ingress_ssh" {}
variable "ingress_http" {}
variable "egress_all" {}

# -------- EC2 --------
variable "ami" {}
variable "instance_type" {}
variable "associate_public_ip" {}
variable "key_name" {}
variable "instance_tags" {}

# -------- S3 --------
variable "bucket_name" {}
variable "bucket_tags" {}
