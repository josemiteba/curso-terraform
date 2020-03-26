# Configure the MySQL provider
provider "mysql" {
  endpoint = "localhost:3306"
  username = "jmteba"
  password = "123456"
  version = "~> 1.8"
}

# Create a Database
resource "mysql_database" "bbdd" {
  name = "prueba_bd_2"
}

# Create user
resource "mysql_user" "usuario" {
  user               = "${var.usuario}"
  host               = "localhost"
  plaintext_password = "${var.password}"
}

# Users permisions
resource "mysql_grant" "permisos_bd" {
  user       = "${mysql_user.usuario.user}"
  host       = "${mysql_user.usuario.host}"
  database   = "${mysql_database.bbdd.name}"
  privileges = ["SELECT", "UPDATE"]
}