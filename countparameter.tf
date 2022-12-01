provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "Ec2-1" {
    ami = "ami-0b0dcb5067f052a63"
    instance_type = "t2.micro"
    count = 5
}

----------------------------
resource "aws_iam_user" "iam" {
    name = "sai".${count.index}
    count = 5
    path = "/system/"
}
-----------------------------
    
provider "aws" {
    region = "us-east-1"
}

variable "elb_names" {
    type = list
    default = ["dev-sai","stage-sai","prod-sai"]

resource "aws_iam_user" "iam" {
    name = var.elb_names[count.index]
    count = 3
    path = "/system/"
}
