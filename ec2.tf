data "aws_ami" "amazon_linux" {
    most_recent = true
    owners = ["amazon"]
    filter {
        name   = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

resource "aws_instance" "bastion" {
    ami           = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type
    subnet_id     = aws_subnet.public.id
    key_name      = var.key_pair_name
    vpc_security_group_ids = [aws_security_group.bastion.id]

    tags = { Name = "${var.project_name}-bastion"}
}

resource "aws_instance" "app" {
    ami           = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type
    subnet_id     = aws_subnet.private.id
    key_name      = var.key_pair_name
    vpc_security_group_ids = [aws_security_group.bastion.id]
    
    user_data = <<-EOF
      #!/bin/bash
      yum update -y
      yum install -y nginx
      systemctl start nginx
      systemctl enable nginx
      echo "<h1>Hello from Baskaran's Private EC2!</h1>" > /var/www/html/index.html
    EOF

    tags = { Name = "${var.project_name}-app-server" }
}