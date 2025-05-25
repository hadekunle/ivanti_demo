resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "MainVPC",
    env  = "${var.environment}"
  }
}