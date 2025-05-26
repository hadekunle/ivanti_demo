resource "aws_instance" "flask_app" {
  ami                    = "ami-0953476d60561c955"
  instance_type          = "t2.micro"
  key_name               = "ivanti_key"
  vpc_security_group_ids = [aws_security_group.flask_sg.id]
  depends_on             = [aws_security_group.flask_sg]

  user_data = file("../src/user_data.sh")

  tags = {
    Name        = var.project_name
    Environment = var.environment
  }
}

