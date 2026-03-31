# ---------------- VPC MODULE ----------------

module "vpc" {

  source = "./modules/vpc"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr

  az_1 = var.az_1
  az_2 = var.az_2

  map_public_ip = var.map_public_ip

  public_subnet_tags  = var.public_subnet_tags
  private_subnet_tags = var.private_subnet_tags

  igw_tags = var.igw_tags
  eip_tags = var.eip_tags
  nat_tags = var.nat_tags

  public_rt_tags  = var.public_rt_tags
  private_rt_tags = var.private_rt_tags

  internet_cidr = var.internet_cidr

  sg_name        = var.sg_name
  sg_description = var.sg_description
  sg_tags        = var.sg_tags

  ingress_ssh  = var.ingress_ssh
  ingress_http = var.ingress_http
  egress_all   = var.egress_all
}

# ---------------- EC2 MODULE ----------------

module "ec2" {

  source = "./modules/ec2-instances"

  ami           = var.ami
  instance_type = var.instance_type

  subnet_id          = module.vpc.public_subnet_id
  security_group_ids = [module.vpc.security_group_id]

  associate_public_ip = var.associate_public_ip
  key_name            = var.key_name
  instance_tags       = var.instance_tags

}


# ---------------- S3 MODULE ----------------

module "s3" {

  source = "./modules/s3-bucket"

  bucket_name = var.bucket_name
  bucket_tags = var.bucket_tags

}

