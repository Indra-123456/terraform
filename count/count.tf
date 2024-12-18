resource "aws_instance" "web" {
  count = length(var.instance_names)
  ami           = var.ami_id
  instance_type = var.instance_names[count.index] == "mongodb" || var.instance_names[count.index] == "mysql" || var.instance_names[count.index] == "shipping" ? "t3.small" : "t2.micro"
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
  records = [var.instance_names[count.index] == "web" ? aws_aws_instance.web[count.index].publicip : aws_instance.web[count.index].private_ip]
}