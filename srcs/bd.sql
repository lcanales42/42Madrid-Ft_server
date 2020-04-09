CREATE DATABASE wordpress; /*Creas la base de datos.*/
GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost'; /*Dar todos los permisos sobre tu vase de datos*/
FLUSH PRIVILEGES; /* actualizas los permisos de los ususarios*/
update mysql.user set plugin = 'mysql_native_password' where user='root';