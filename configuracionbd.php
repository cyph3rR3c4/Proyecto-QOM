<?php 
$host           = "localhost:3307";
$usuario_bd     = "root";
$contraseña  = " ";
$nombre_bd      = "cuentas_usuario";
$dsn            = "mysql:host=$host;dbname=$nombre_bd";


try {
    $conexion = new PDO($dsn, $usuario_bd, $contraseña);
} catch(PDOException $error) {
    echo $error->getMessage();
}
?>