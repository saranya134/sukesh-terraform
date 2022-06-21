
resource "aws_lb" "example" {
  name               = "terraform-asg-example"
  load_balancer_type = var.load_balancer_type
  subnets            = data.aws_subnets.default.ids
  security_groups    = [aws_security_group.alb.id]
}