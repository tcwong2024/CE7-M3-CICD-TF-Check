#################################################################################
# EC2 Instance - this ec2 is not completed, use for vulnerability testing 
#################################################################################

resource "aws_instance" "wtc_tf_instance" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  #   associate_public_ip_address = true
  #   subnet_id                   = aws_subnet.wtc_tf_public_subnet_az1.id
  #   key_name                    = var.key_name
  #   vpc_security_group_ids      = [aws_security_group.wtc_tf_sg_allow_ssh_http_https.id]

  #   user_data = <<-EOF
  #                 #!/bin/bash
  #                 yum update -y
  #                 yum install httpd -y
  #                 yum install docker -y
  #             EOF

  #checkov:skip=CKV_AWS_79: Ensure Instance Metadata Service Version 1 is not enabled
  #checkov:skip=CKV_AWS_135: Ensure that EC2 is EBS optimized
  #checkov:skip=CKV_AWS_126: Ensure that detailed monitoring is enabled for EC2 instances
  #checkov:skip=CKV_AWS_8: Ensure all data stored in the Launch configuration or instance Elastic Blocks Store is securely encrypted
  #checkov:skip=CKV2_AWS_41: Ensure an IAM role is attached to EC2 instance

  tags = {
    Name = var.ec2_name
  }
}

#################################################################################
# Security Group 
#################################################################################

resource "aws_security_group" "wtc_tf_sg_allow_ssh_http_https" {
  name = var.securityGrp_name
  #vpc_id = aws_vpc.wtc_tf_vpc.id

  # Port 80 for HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Port 443 for HTTPS
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Port 22 for SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # "-1" Allows all protocols
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  #checkov:skip=CKV_AWS_260: Ensure no security groups allow ingress from 0.0.0.0:0 to port 80
  #checkov:skip=CKV_AWS_24: Ensure no security groups allow ingress from 0.0.0.0:0 to port 22
  #checkov:skip=CKV_AWS_23: Ensure every security group and rule has a description
  #checkov:skip=CKV2_AWS_5: Ensure that Security Groups are attached to another resource

  tags = {
    Name = var.securityGrp_name
  }
}
