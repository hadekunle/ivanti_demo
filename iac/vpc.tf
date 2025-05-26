resource "random_pet" "example" {
  length    = 1    # Number of words in the name
  separator = "-"  # Separator between words
}

resource "aws_security_group" "flask_sg" {
  name        = "flask_app_sg-${random_pet.example.id}"
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

  depends_on = [ random_pet.example ]

  tags = {
    Name        = "flask_app_sg-${random_pet.example.id}"
    Environment = var.environment
  }
}
