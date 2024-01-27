variable "ec2instance" {
    type = map(string)

    default = {
           ami = "ami-0c7217cdde317cfec"
  instance_type = "t3.micro"
  instance_count = "3"
    }
}