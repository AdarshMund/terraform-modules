output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet" {
  value = module.vpc.public_subnet_id
}

output "private_subnet" {
  value = module.vpc.private_subnet_id
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "instance_public_ip" {
  value = module.ec2.public_ip
}

output "s3_bucket" {
  value = module.s3.bucket_id
}
output "s3_bucket_arn" {

  value = module.s3.bucket_arn
}
