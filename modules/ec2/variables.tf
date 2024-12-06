variable "ami" {
  description = "ID AMI untuk instance EC2"
  type        = string
}

variable "instance_name" {
  description = "Nama instance EC2"
  type        = string
}

variable "subnet_id" {
  description = "ID subnet untuk EC2"
  type        = string
}

variable "vpc_id" {
  description = "ID VPC untuk EC2"
  type        = string
}

variable "security_group_ids" {
  description = "Daftar ID security group untuk EC2"
  type        = list(string)
}

variable "associate_eip" {
  description = "Tentukan apakah EIP harus dikaitkan"
  type        = bool
  default     = false
}
