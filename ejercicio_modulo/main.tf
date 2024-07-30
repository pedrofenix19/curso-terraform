module "bucket_1" {
  source = "./bucket_publico"
}

module "bucket_parametros" {
  source = "./bucket_usuario"

  usuario = "Pedro.Deniz"
  prefijo_bucket = "pedro-modulo-parametros"
}

module "bucket_data_source" {
  source = "./bucket_data_source"

  prefijo_bucket = "pedro-data-source"
}