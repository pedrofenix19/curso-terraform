resource "aws_instance" "ec2_terraform" {
  ami           = "ami-0427090fd1714168b"
  instance_type = "t2.micro"
  security_groups = ["launch-wizard-1"]

    tags = {
      "Name" = "pedro-ec2-importada"
    }
}