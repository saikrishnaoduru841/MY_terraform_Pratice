provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "Ec2-1" {
    ami = "ami-0b0dcb5067f052a63"
    instance_type = var.types["us-east-1"]
    # instance_type = var.list[0]

}

variable "list" {
   type = list
   default = ["t2.medium","t2.large","t2.xlarge"]
}

variable "types" {
   type = map
   default = {
     us-east-1 = "t2.small"
     us-west-1 = "t2.micro"
     us-east-2 = "t2.nano"
   }
}
