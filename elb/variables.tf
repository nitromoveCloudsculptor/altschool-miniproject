variable "elb_name" {
  type        = string
  description = "The name of the Elastic Load Balancer"
  default     = "my-elb"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones for the Elastic Load Balancer"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "listener_port" {
  type        = number
  description = "The port on which the load balancer will listen for incoming requests"
  default     = 80
}

variable "health_check_target" {
  type        = string
  description = "The target for the health check (e.g., HTTP:80/)"
  default     = "HTTP:80/"
}

variable "health_check_interval" {
  type        = number
  description = "The interval between health checks (in seconds)"
  default     = 30
}

variable "health_check_timeout" {
  type        = number
  description = "The amount of time to wait when receiving a response from the health check (in seconds)"
  default     = 3
}

variable "unhealthy_threshold" {
  type        = number
  description = "The number of consecutive health check failures required before considering an instance unhealthy"
  default     = 2
}

variable "healthy_threshold" {
  type        = number
  description = "The number of consecutive health check successes required before considering an instance healthy"
  default     = 2
}
resource "aws_elb" "my_elb" {
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

}
