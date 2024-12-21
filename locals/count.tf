resource "aws_instance" "web" {
  
  ami           = var.ami_id
  instance_type = local.instance_type
  tags = {
    Name = "locals"
  }
}


# resource "aws_route53_record" "www" {
#   count = length(var.instance_names)
#   zone_id = "Z123456"
#   name    = "${var.instance_names[count.index]}.daws76s.online"    #interpolation
#   type    = "A"
#   ttl     = 1
#   records = [local.ip]
# }