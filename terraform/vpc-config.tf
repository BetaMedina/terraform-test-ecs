resource "aws_default_vpc" "default_vpc" {

}

resource "aws_default_subnet" "subnet_a" {
  availability_zone = "us-east-1a"
}

resource "aws_default_subnet" "subnet_b" {
  availability_zone = "us-east-1b"
}

resource "aws_default_subnet" "subnet_c" {
  availability_zone = "us-east-1c"
}
