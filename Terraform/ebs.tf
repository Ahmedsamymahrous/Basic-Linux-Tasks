# Create EBS Volume
resource "aws_ebs_volume" "incorta_ebs" {
  availability_zone = "us-east-2b"
  size              = 30

  tags = {
    Name = "Incorta"
  }
}

# Attach the Volume to Incorta instance
resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.incorta_ebs.id
  instance_id = aws_instance.Incorta.id
}