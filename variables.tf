variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "ID dari AMI yang digunakan untuk EC2"
  type        = string
  default     = "ami-0c02fb55956c7d316"
}

variable "vpc_cidr_block" {
  description = "CIDR block untuk VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "db_name" {
  description = "Nama database untuk RDS"
  type        = string
  default     = "pasarmalangan"
}

variable "db_user" {
  description = "Username untuk database"
  type        = string
  default     = "constanknd"
}

variable "db_password" {
  description = "Password untuk database"
  type        = string
  default     = "constanknd123"
}