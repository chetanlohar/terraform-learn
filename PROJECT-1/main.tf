# Configure the AWS Provider
provider "aws" {
    region = "us-east-1"
    access_key = "XXX"
    secret_key = "XXX"
}

# General Template for for Cloud provider
# resource "<provider>_<resource_type>" "name" {
#     # Config options
# }

resource "aws_instance" "my-first-ec2-instance" {
  ami           = "ami-07d9b9ddc6cd8dd30" # ami-0568072f574d822a4
  instance_type = "t2.micro"
  tags = {
    Name = "my-ubuntu-v1"
  }
}

resource "aws_vpc" "my-vpc-v1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "prod-vpc"
  }
}

resource "aws_subnet" "my-subnet-1" {
  vpc_id     = aws_vpc.my-vpc-v1.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod-subnet"
  }
}