terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
  profile = "nadeera"
}

resource "aws_instance" "example" {
  ami                    = "ami-002829755fa238bfa"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
            #!/bin/bash
            sudo su
            yum -y install httpd
            echo "<p> My Instance! </p>" >> /var/www/html/index.html
            systemctl enable httpd
            systemctl start httpd
            EOF

  tags = {
    Name = "terraform-example"
  }
}


output "DNS" {
  value = aws_instance.example.public_dns
}
