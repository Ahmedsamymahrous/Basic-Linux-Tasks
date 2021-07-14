resource "aws_instance" "Incorta" {
  ami                    = "ami-01e36b7901e884a10" # CentOS 7
  instance_type          = "t2.large"
  vpc_security_group_ids = [ aws_security_group.Incorta.id ]
  key_name               = "centos"  

  tags = {
    Name = "Incorta"
  }
}