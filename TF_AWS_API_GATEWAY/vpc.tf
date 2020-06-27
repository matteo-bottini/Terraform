resource "aws_vpc" "api_vpc" {
  cidr_block = "10.46.0.0/16"

  tags = {
    name = "main"
  }
}
