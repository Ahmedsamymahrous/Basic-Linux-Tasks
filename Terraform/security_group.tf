resource "aws_security_group" "Incorta" {
  name        = "Incorta"
  description = "Allow SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Incorta"
  }
}