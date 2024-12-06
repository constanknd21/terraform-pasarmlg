resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  security_groups = var.security_group_ids  # Pastikan menggunakan security_groups, bukan groupName
  tags = {
    Name = var.instance_name
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.ec2_instance.id
  lifecycle {
    create_before_destroy = true
  }
}

output "public_ip" {
  value = aws_eip.eip.public_ip
}
