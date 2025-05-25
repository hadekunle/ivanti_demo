provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "flask_sg" {
  name        = "flask_app_sg"
  description = "Security group for Flask application"

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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

resource "aws_instance" "flask_app" {
  ami                    = "ami-0953476d60561c955"
  instance_type          = "t2.micro"
  key_name               = "ivanti_key"
  vpc_security_group_ids = [aws_security_group.flask_sg.id]
  depends_on             = [aws_security_group.flask_sg]

  user_data = file("./user_data.sh")

  tags = {
    Name        = var.project_name
    Environment = var.environment
  }
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = "http://${aws_instance.flask_app.public_ip}:5000"
}