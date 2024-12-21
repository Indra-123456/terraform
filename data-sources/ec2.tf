resource "aws_instance" "web" {
  ami           = data.aws_ami.centos8.id
  instance_type = "t2.micro"
  #vpc_security_group_ids = [aws_security_group.roboshop-all.id]

  tags = {
    Name = "data-source"
  }
}