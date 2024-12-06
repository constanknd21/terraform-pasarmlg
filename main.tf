provider "aws" {
  region = var.aws_region
  profile = "default"
}

module "vpc" {
  source      = "./modules/vpc"
  cidr_block  = var.vpc_cidr_block
}

module "ec2_backend" {
  source          = "./modules/ec2"
  instance_name   = "backend"
  ami             = var.ami_id
  vpc_id          = aws_vpc.main.id
  subnet_id       = aws_subnet.public.id  
  security_group_ids = ["default"]  
  associate_eip   = true
}

module "ec2_frontend" {
  source          = "./modules/ec2"
  instance_name   = "frontend"
  ami             = var.ami_id
  vpc_id          = aws_vpc.main.id 
  subnet_id       = aws_subnet.public.id  #
  security_group_ids = ["default"] 
  associate_eip   = true
}

module "rds" {
  source            = "./modules/rds"
  db_name           = "pasarmalangan"  
  db_user           = "constanknd"
  db_password       = "constanknd123"
  subnet_ids        = [module.vpc.public_subnet_id]
  security_group_ids = ["default"]
}


output "backend_ip" {
  value = module.ec2_backend.public_ip
}

output "frontend_ip" {
  value = module.ec2_frontend.public_ip
}

output "rds_endpoint" {
  value = module.rds.endpoint
}
