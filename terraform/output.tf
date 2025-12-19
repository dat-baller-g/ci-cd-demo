output "public_ip" {
  value = aws_instance.web_app_server.public_ip
}