resource "aws_security_group" "allow_ssh" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc-id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_instance" "app_server" {

  ami           = var.ami_id
  instance_type = var.instance
  key_name = "sayali"
  associate_public_ip_address = true
  subnet_id = var.subnet-1-id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = join("-", [terraform.workspace, "app-server"])

  }
}