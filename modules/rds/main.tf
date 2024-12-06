resource "aws_db_subnet_group" "main" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = var.subnet_ids  # Pastikan ini mencakup dua subnet dari dua AZ yang berbeda
}

resource "aws_db_instance" "main" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  db_name             = var.db_name
  username             = var.db_user
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.main.name
  publicly_accessible  = false
  vpc_security_group_ids = var.security_group_ids
}

output "endpoint" {
  value = aws_db_instance.main.endpoint
}