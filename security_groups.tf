resource "aws_security_group" "bastion" {
    name        = "${var.project_name}-bastion-sg"
    description = "Allow SSH from my IP only"
    vpc_id      = aws_vpc.main.id

ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
}

egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

tags = { Name = "${var.project_name}-bastion-sg"}
}