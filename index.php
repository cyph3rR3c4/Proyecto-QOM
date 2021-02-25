<?php
require 'configuracionbd.php';
?>

<?php if (isset($_POST['submit']) && $statement): ?>
	<blockquote><?php echo $_POST['nombre'];?></blockquote>
<?php endif; ?>
<!DOCTYPE html>
<html>
<head>
	<title>Quick Order Managemente</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>



<div>
	<?php
	
	?>	
</div>

<div>
	<form action="index.php" method="post">
	<center>
    <form method="POST" action ="index.php"> 
       
		<div class="container">
			
			<div class="box">
				<div class="col-sm-3">
					<h1>Registro</h1>
					<p>Llena los siguientes campos.</p>
					<hr class="mb-3">
					<label for="nombre"><b>Nombre</b></label>
					<input class="form-control" id="nombre" type="text" name="nombre" required>

					<label for="apellido"><b>Apellido</b></label>
					<input class="form-control" id="apellido"  type="text" name="apellido" required>

					<label for="correo"><b>Correo @misena</b></label>
					<input class="form-control" id="correo"  type="email" name="email" required>

				
					<label for="contraseña"><b>Contraseña</b></label>
					<input class="form-control" id="Contraseña"  type="password" name="Contraseña" required>
					<hr class="mb-3">
					<input  class="btn btn-primary" type="submit" id="registro" name="registro" value="Registrarse">
				</div>
			</div>
		</div>
	</form>
</div>

</body>
</html>