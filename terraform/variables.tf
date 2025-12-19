variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "root_volume_size" {
  default = 8
}

variable "key_name" {
  description = "devops-demo-key"
}

variable "ami_id" {
  description = "Ubuntu ami id for us-east-1"
  
}