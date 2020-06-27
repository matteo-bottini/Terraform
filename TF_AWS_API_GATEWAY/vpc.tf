resource "aws_vpc" "api_vpc" {
  cidr_block = var.cidr

  tags = {
    name = "main"
  }
}
