data "aws_caller_identity" "current" {}

locals {
  aws_account_id = data.aws_caller_identity.current.account_id
}

resource "aws_instance" "web" {
  ami           = "ami-0f918f7e67a3323f0"  # Replace with your desired AMI ID
  instance_type = var.instance_type
  key_name      = var.key_name
  region        = var.aws_region
  subnet_id     = aws_subnet.public[0].id
  associate_public_ip_address = true
  security_groups = [aws_security_group.this.id]
  user_data = <<-EOF
    #!/bin/bash
    sudo -i
    apt-get update
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt-get update
    apt-get install -y docker-ce
    usermod -aG docker ubuntu
    systemctl enable docker
    systemctl start docker
  EOF

  tags = {
    Name = "Ops_vidya_web_instance"
  }
}