resource "aws_route53_zone" "mydns_zone" {
  name    = "ishaqcloudsculptor.com.ng"
  comment = "My Route 53 hosted zone"
}

resource "aws_route53_record" "example_record" {
  type     = "A"
  ttl      = "300"
  records  = ["1.2.3.4"]
  zone_id  = aws_route53_zone.mydns_zone.id
  name     = "ishaqcloudsculptor.com.ng"
}
