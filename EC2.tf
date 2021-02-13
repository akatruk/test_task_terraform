provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region     = var.region
}

resource "aws_instance" "ec2" {
    count = length(var.vpc)
    ami                     = var.ami_redhut #redhut
    instance_type           = var.instance_type
    tags = {
        owner = var.owner
        Name = sort(var.vpc)[count.index]
        goal = var.goal
    }
    key_name = aws_key_pair.deploy_ssh_key.id
    vpc_security_group_ids  = [aws_security_group.allow_ssh.id]
    /* user_data = file("postgres.sh") */
}

resource "aws_key_pair" "deploy_ssh_key" {
    key_name   = "deployer-key3"
    public_key = file("/Users/akatruk/.ssh/id_rsa.pub")
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_tls"
  description = "allow ssh inbound traffic"

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "allow_postgres" {
  name        = "allow_postgres"
  description = "allow postgres inbound traffic"

  ingress {
    description = "ssh"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

output "ip_ec2" {
  value = aws_instance.ec2[*].public_ip
}