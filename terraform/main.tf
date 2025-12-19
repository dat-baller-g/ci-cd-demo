provider "aws" {
  region = var.aws_region
}

# --------------------------
# Security Group for EC2 & RDS
# --------------------------
# EC2 Security Group
resource "aws_security_group" "ec2_sg" {
  name = "devops-ec2-sg"

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

# RDS Security Group
resource "aws_security_group" "rds_sg" {
  name = "devops-rds-sg"

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# --------------------------
# EC2 Instance
# --------------------------
resource "aws_instance" "web_app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  root_block_device {
    volume_size = var.root_volume_size
  }
  security_groups = [aws_security_group.ec2_sg.name]

  tags = {
    Name = "devops-ci-cd-demo"
  }
}

# --------------------------
# RDS Subnet Group (minimal)
# --------------------------
resource "aws_db_subnet_group" "rds_subnets" {
  name       = "devops-demo-rds-subnet"
  subnet_ids = var.subnet_ids   # You need at least 2 subnets for RDS

  tags = {
    Name = "devops-demo-rds-subnet"
  }
}

# --------------------------
# RDS Database
# --------------------------
resource "aws_db_instance" "app_db" {
  allocated_storage    = var.rds_storage  
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name                 = var.rds_db_name
  username             = var.rds_username
  password             = var.rds_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  publicly_accessible  = false
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnets.name

  tags = {
    Name = "devops-ci-cd-demo-db"
  }
}


















# provider "aws" {
#   region = var.aws_region
# }

# resource "aws_security_group" "app_sg" {
#   name = "devops-demo-sg"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_instance" "web_app_server" {
#   ami           = var.ami_id
#   instance_type = var.instance_type
#   key_name      = var.key_name
#   root_block_device {
#     volume_size = var.root_volume_size
#   }
#   security_groups = [aws_security_group.app_sg.name]

#   tags = {
#     Name = "devops-ci-cd-demo"
#   }
# }