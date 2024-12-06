variable "db_name" {
  description = "database_rds"
  type        = string
}

variable "db_user" {
  description = "constanknd"
  type        = string
}

variable "db_password" {
  description = "constanknd123"
  type        = string
}

variable "subnet_ids" {
  description = "Daftar subnet yang digunakan oleh RDS"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Daftar Security Group untuk RDS"
  type        = list(string)
}