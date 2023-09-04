terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 4.0.0"
      }
    }
}

provider "aws" {
  region = "us-west-2"
  profile = "nadeera"
}

resource "aws_instance" "example" {
  ami           = "ami-002829755fa238bfa"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}
