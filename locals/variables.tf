variable "instance_names" {
    type = list
    default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "shipping", "payment", "cart", "dispatch", "web"]
}

variable "ami_id" {
    type = string
    default = "ami-0b4f379183e5706b9"
  
}