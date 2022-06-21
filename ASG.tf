resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.name
  vpc_zone_identifier  = data.aws_subnets.default.ids
  target_group_arns = [aws_lb_target_group.asg.arn]
  health_check_type = "ELB"
 
  name                 = "asg"
  min_size = 1
  max_size = 2

  instance_refresh {
    strategy = "Rolling"
    triggers = ["launch_configuration"]
    preferences {
      min_healthy_percentage = 50
    }
  }

 
  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
 
}
}