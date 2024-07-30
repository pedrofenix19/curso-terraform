resource "local_file" "archivos" {
  count    = length(var.contenidos_de_archivo)
  content  = var.contenidos_de_archivo[count.index]
  filename = "${path.module}/archivo_${count.index}.txt"
}


resource "aws_s3_bucket" "bucket_pedro" {
  bucket_prefix = "pedro-terraform-proyecto-final"
  force_destroy = true
}

resource "aws_s3_object" "objects" {
  count = length(var.contenidos_de_archivo)
  bucket = aws_s3_bucket.bucket_pedro.bucket
  key    = local_file.archivos[count.index].filename
  source = local_file.archivos[count.index].filename

}

resource "aws_instance" "ec2_final" {
  ami             = "ami-0427090fd1714168b"
  instance_type   = "t2.micro"
  security_groups = ["launch-wizard-1"]

  tags = {
    "Name" = "pedro-proyecto-final"
    "NombreBucket" = aws_s3_bucket.bucket_pedro.id
  }
}