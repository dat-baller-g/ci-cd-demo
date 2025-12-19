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

variable "subnet_ids" {
  description = "List of subnet IDs for RDS"
  type        = list(string)
  default = [ "subnet-089a61be5af7e6531", "subnet-033a982ff4b82b56c" ]
}

variable "rds_db_name" {
  description = "RDS database name"
  default     = "devopsdb"
}

variable "rds_username" {
  description = "RDS master username"
  default     = "admin"
}

variable "rds_password" {
  description = "RDS master password"
  default     = "Admin1234!" 
}

variable "rds_storage" {
  description = "RDS storage in GB"
  default     = 20
}