resource "aws_instance" "webserver" {
    ami = var.ec2instance["ami"]
    instance_type = var.ec2instance["instance_type"]
    count =  var.ec2instance["instance_count"]

    vpc_security_group_ids = ["sg-0e984e5deb2d6df72"]
  subnet_id              = "subnet-04caa4a48600a661e"     

  tags = {
    Name = "MyWebServer-${count.index + 1}"

  }


}

  output "public_ips" {
    value = aws_instance.webserver[*].public_ip
  }