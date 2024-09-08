resource "aws_lb" "appLoadBalancer" {
  name                       = "${local.projectCore}-app-load-balancer"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.allow_tls.id]
  subnets                    = [for subnet in aws_subnet.public_sub : subnet.id]
  enable_deletion_protection = false

  tags = merge(
    { Name = "Application Load Balancer" },
    local.tags
  )
}

resource "aws_lb_target_group" "appLbTg" {
  name        = "${local.projectCore}-app-lb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.my_vpc.id

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = 80
  }
}

resource "aws_lb_target_group_attachment" "webDisp" {
  target_group_arn = aws_lb_target_group.appLbTg.arn
  target_id        = aws_instance.web_disp[count.index].id
  port             = 80
  count            = var.public_subnet_count
}

resource "aws_lb_listener" "appLoadListner" {
  load_balancer_arn = aws_lb.appLoadBalancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.appLbTg.arn
  }
}
