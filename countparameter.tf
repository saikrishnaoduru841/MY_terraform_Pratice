provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "Ec2-1" {
    ami = "ami-0b0dcb5067f052a63"
    instance_type = "t2.micro"
    count = 5
}


resource "aws_iam_user" "iam" {
    name = "sai".${count.index}
    count = 5
    path = "/system/"
}
