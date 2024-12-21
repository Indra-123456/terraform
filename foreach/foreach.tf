resource "aws_instance" "web" {
  for_each = var.instance_names
  ami           = var.ami_id
  instance_type = each.value
  tags = {
    Name = each.key
  }
}


resource "aws_route53_record" "www" {
  for_each = aws_instance.web
  zone_id = "Z123456"
  name    = "${each.key}.daws76s.online"    #interpolation
  type    = "A"
  ttl     = 1
  records = [each.key == "web" ? each.value.public_ip : each.value.private_ip]
}

# output "instance_info" {
#     value = aws_instance.web
    
  
# }