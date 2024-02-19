resource "aws_security_group" "alb_sg" {
  name = "code-deploy-sg"
  description = "Ingress for alb"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops-projects"
  }
}