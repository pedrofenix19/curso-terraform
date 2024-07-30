

resource "local_file" "archivo_ejemplo" {
  content  = "Hola ${var.nombre_alumno}"
  filename = "${path.module}/foo.bar"
}

resource "local_sensitive_file" "contenido_sensible" {
  content  = local_file.archivo_ejemplo.content_base64sha256
  filename = "${path.module}/foo_secreto.bar"
}