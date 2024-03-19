resource "aws_lb" "backend-fast-food-lb" {
  name               = "LB-${var.projectName}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.backend-fast-food-sg.id}"]
  subnets            = ["${var.subnet}"]
}

resource "aws_lb_target_group" "backend-fast-food-tg" {
  name     = "TG-${var.projectName}"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = "${var.vpcId}"
}

resource "aws_lb_listener" "backend-fast-food-listener" {
  load_balancer_arn = aws_lb.backend-fast-food-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.backend-fast-food-tg.arn
    type             = "forward"
  }
}
