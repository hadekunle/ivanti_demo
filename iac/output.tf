output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = "http://${aws_instance.flask_app.public_ip}:5000"
}