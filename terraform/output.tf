output "public_ip" {
  value = aws_instance.web_app_server.public_ip
}

output "ec2_public_ip" {
  description = "EC2 Public IP address"
  value       = aws_instance.web_app_server.public_ip
}

output "ec2_private_ip" {
  description = "EC2 Private IP address"
  value       = aws_instance.web_app_server.private_ip
}

output "ec2_instance_id" {
  description = "EC2 instance id"
  value       = aws_instance.web_app_server.id
}

output "rds_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.app_db.endpoint
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.app_db.port
}

output "rds_instance_id" {
  description = "RDS instance ID"
  value       = aws_db_instance.app_db.id
}