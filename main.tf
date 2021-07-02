#variable "access_key" {}
#variable "secret_key" {}
variable "region" {
  default = "us-east-2"
}
  
provider "aws" {
  access_key = $AWS_ACCESS_KEY_ID
  secret_key = $AWS_SECRET_ACCESS_KEY
  region     = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "ami-09ff94ae883853013"
  instance_type = "t2.micro"
  tags = {
    Harness = "Andy_Tag"
  }  
}

output "public-ip" {
  value = "${aws_instance.example.public_ip}"
}

output "region" {   
  value = "${var.region}" 
}

output "subnet_id" {
  value = "${aws_instance.example.subnet_id}"
}

output "instanceTags" {
  value = "${aws_instance.example.tags["Harness"]}"
}
