provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "app_sg" {
  name = "devops-demo-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  root_block_device {
    volume_size = var.root_volume_size
  }
  security_groups = [aws_security_group.app_sg.name]

  tags = {
    Name = "devops-ci-cd-demo"
  }
}