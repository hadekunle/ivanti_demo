resource "aws_instance" "flask_app" {
  ami                    = "ami-0953476d60561c955"
  instance_type          = "t2.micro"
  key_name               = "ivanti_key"
  vpc_security_group_ids = [aws_security_group.flask_sg.id]
  depends_on             = [aws_security_group.flask_sg]

  user_data = file("${path.module}/../src/user_data.sh", {
  })
  tags = {
    Name        = var.project_name
    Environment = var.environment
    
  }
}

resource "aws_ec2_instance_metadata_defaults" "enforce-imdsv2" {
  instance_metadata_tags = "enabled"
  http_endpoint          = "enabled"
}