
resource "aws_launch_configuration" "example" {
  image_id        = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.instance.id]
  associate_public_ip_address = true
  name_prefix = "Launch_config-"
  user_data   = file("./script.sh")
 
  lifecycle {
    create_before_destroy = true
  }
}