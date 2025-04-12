provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0c94855ba95c71c99" # Ubuntu 20.04 in us-east-1
  instance_type = "t2.micro"
  key_name      = var.key_name

  tags = {
    Name = "Ansible-Web"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > inventory"
  }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}
