resource "aws_elb" "elb" {
  name               = var.elb_name
  availability_zones = var.availability_zones
  listener {
    instance_port     = var.listener_port
    instance_protocol = "HTTP"
    lb_port           = var.listener_port
    lb_protocol       = "HTTP"
  }

  health_check {
    target              = var.health_check_target
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    unhealthy_threshold = var.unhealthy_threshold
    healthy_threshold   = var.healthy_threshold
  }

  provisioner "local-exec" {
    command = "ansible-playbook configuredns.yml"
    environment = {
      ELB_DNS_NAME = aws_elb.elb.dns_name
    }
  }
}

output "elb_dns_name" {
  value = aws_elb.elb.dns_name
}