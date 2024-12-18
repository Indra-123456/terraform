resource "aws_instance" "web" {
  count = length(var.instance_names)
  ami           = var.ami_id
  instance_type = local.instance_type
  tags = {
    Name = var.instance_names[count.index]
  }
}


resource "aws_route53_record" "www" {
  count = length(var.instance_names)
  zone_id = "Z123456"
  name    = "${var.instance_names[count.index]}.daws76s.online"    #interpolation
  type    = "A"
  ttl     = 1
  records = [local.ip]
}