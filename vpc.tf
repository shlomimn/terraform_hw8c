resource "aws_vpc" "hw8" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "hw8_vpc"
  }
}

resource "aws_subnet" "example" {
  count             = 2
  vpc_id            = aws_vpc.hw8.id
  cidr_block        = element(var.private_subnet,count.index)

  depends_on = [aws_vpc.hw8]
}


variable "private_subnet" {
  type = list
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}