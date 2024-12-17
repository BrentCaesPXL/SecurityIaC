provider "aws" {
    region = "us-west-2"
}
resource "aws_s3_bucket" "my_bucket" {
    bucket = "my-secure-presentation-bucket"
}
resource "aws_instance" "my_instance" {
    ami = "ami-12345678"
    instance_type = "t2.micro"
    tags = {
        Name = "My Secure Instance"
    }
}

resource "aws_security_group" "my_security_group" {
    name = "allow_ssh"
    description = "Allow SSH inbound traffic"
    vpc_id = "vpc-12345678"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}