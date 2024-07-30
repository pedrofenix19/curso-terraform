resource "aws_instance" "ec2_terraform" {
  ami             = "ami-0427090fd1714168b"
  instance_type   = "t2.micro"
  security_groups = ["launch-wizard-1"]

  tags = local.tags_globales
}

locals {
  nombre_proyecto = "Curso"

  tags_globales = {
    "Name"    = "pedro-local"
    "owner"   = "pedro"
    "project" = local.nombre_proyecto
  }
}