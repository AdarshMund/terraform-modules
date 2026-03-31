# -------- Provider --------
region = "ap-south-1"

# -------- Backend --------
backend_bucket = "adarsh-terraform-state-bucket"
backend_key    = "project/terraform.tfstate"
backend_region = "ap-south-1"
dynamodb_table = "terraform-lock"

# -------- VPC --------
vpc_cidr = "192.168.0.0/16"

public_subnet_cidr  = "192.168.1.0/24"
private_subnet_cidr = "192.168.2.0/24"

az_1 = "ap-south-1a"
az_2 = "ap-south-1b"

map_public_ip = true

public_subnet_tags = {
  Name = "public-subnet"
}

private_subnet_tags = {
  Name = "private-subnet"
}

igw_tags = {
  Name = "igw"
}

eip_tags = {
  Name = "eip"
}

nat_tags = {
  Name = "nat"
}

public_rt_tags = {
  Name = "public-rt"
}

private_rt_tags = {
  Name = "private-rt"
}

internet_cidr = "0.0.0.0/0"

sg_name        = "web-sg"
sg_description = "allow ssh and http"

sg_tags = {
  Name = "web-sg"
}

ingress_ssh = {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

ingress_http = {
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

egress_all = {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

# -------- EC2 --------
ami           = "ami-0931307dcdc2a28c9"
instance_type = "t3.micro"

associate_public_ip = true
key_name            = "adarsh"

instance_tags = {
  Name = "web-instance"
}

# -------- S3 --------
bucket_name = "adarsh-final-bucket-12345"

bucket_tags = {
  Name = "project-bucket"
}
