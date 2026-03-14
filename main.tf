provider "aws" {
  region = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "webserver" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"

  key_name = "aws"

  //vpc_security_group_ids = ["sg-0162dca4bbe268ca0"]

  user_data = file("userdata.sh")

  tags = {
    Name = "Terraform-WebServer"
  }
}
