locals {
  instance_type = var.instance_names[count.index] == "mongodb" || var.instance_names[count.index] == "mysql" || var.instance_names[count.index] == "shipping" ? "t3.small" : "t2.micro"
  ip = var.instance_names[count.index] == "web" ? aws_aws_instance.web[count.index].publicip : aws_instance.web[count.index].private_ip
}