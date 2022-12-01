provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "Ec2-1" {
    ami = "ami-0b0dcb5067f052a63"
    instance_type = "t2.micro"

  }

resource "aws_eip" "ib" {
    vpc = true
    
  }

resource "aws_eip_association" "eip_assoc" {
    instance_id = aws_instance.Ec2-1.id
    allocation_id = aws_eip.ib.id
    
  }
resource "aws_security_group" "mysecurity" {
    name = "mysecuritygroup"

    ingress {
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["${aws_eip.ib.public_ip}/32"]
    }
  }
