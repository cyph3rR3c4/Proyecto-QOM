
<?php
require 'configuracionbd.php';


if(isset($_POST['submit'])){

	$usuario_nuevo = array{

		$nombre 		=> $_POST['nombre'];
		$apellido		=> $_POST['apellido'];
		$correo			=> $_POST['correo'];
		$contraseña 	=> $_POST['contraseña'];
	}

	

    $sql = "INSERT INTO usuarios (nombre, apellido, correo, contraseña)
	 VALUES("?","?", "?","?")";

	try {
		$statement = $conexion->prepare($sql);
		$statement->execute($usuario_nuevo);

	} catch(PDOException $error) {
		echo $error->getMessage(;)
	}
		

	

}

