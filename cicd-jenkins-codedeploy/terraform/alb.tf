resource "aws_lb" "myalb" {
  name               = "code-deploy-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = ["subnet-076816db67548507c", "subnet-0eede83c62c94897d", "subnet-093b38fc2e7484d37" ]

  tags = {
    name = "devops-projects"
  }
}


resource "aws_lb_listener" "mylistener" {
  load_balancer_arn = aws_lb.myalb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mytg.arn
  }

  depends_on = [ aws_lb.myalb, aws_lb_target_group.mytg ]
}