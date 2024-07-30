

resource "local_file" "archivo_ejemplo" {
  count    = length(var.nombres_de_archivo)
  content  = "Hola archivo"
  filename = "${path.module}/${var.nombres_de_archivo[count.index]}.bar"
}


resource "aws_s3_bucket" "bucket_pedro" {
  bucket_prefix = "pedro-terraform-ej2"
  force_destroy = true

  tags = {
    "owner" = "Pedro"
    "Ejercicio" = "2"
  }
}

resource "aws_s3_object" "object" {
  count = length(var.nombres_de_archivo)
  bucket = aws_s3_bucket.bucket_pedro.bucket
  key    = local_file.archivo_ejemplo[count.index].filename
  source = local_file.archivo_ejemplo[count.index].filename

}

