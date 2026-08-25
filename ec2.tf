resource "aws_instance" "web" {
  ami           = data.aws_ssm_parameter.ubuntu.value
  instance_type = var.instance_type

  subnet_id = aws_subnet.public_1.id

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  key_name = aws_key_pair.main.key_name

  user_data = file("${path.module}/user-data.sh")

  associate_public_ip_address = true

  tags = {
    Name        = "${var.project_name}-web-server"
    Environment = "lab"
    ManagedBy   = "Terraform"
  }
}
