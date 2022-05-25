resource "aws_security_group" "webserver" {
  vpc_id = var.vpc_id
  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port        = ingress.key
      to_port          = ingress.key
      protocol         = "tcp"
      cidr_blocks      = ingress.value
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SG for ${var.env}"
  }
}