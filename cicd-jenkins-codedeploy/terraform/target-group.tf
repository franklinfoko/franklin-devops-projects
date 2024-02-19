resource "aws_lb_target_group" "mytg" {
  name     = "code-deployTG"
  port     = 80
  protocol = "HTTP"
  health_check {
    protocol = "HTTP"
    path = "/index.html"
  }
  vpc_id   = "vpc-0e479ddc0b9ecb6c4"

  tags = {
    name = "devops-projects"
  }
}

