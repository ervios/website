
<meta http-equiv="content-type" content="text/html; charset=utf8" />


<div id="divcontent">
<h3> Registrering</h3>
<div id="divlinereg"></div>
<div id="regform">

<?php 		
	foreach ($_SESSION['regerrors'] as $row) {
				echo "<li><p>" . $row . "</p></li> " . "<br>";
			}
?>
<h1>Lagets uppgifter:</h1>
	<form action="" method="post" />
	<ul>
		<li>
		<p>Division*:<br> 	
			<select name="div_id">
				<option value="" selected="selected"></option>
  				<option value="1">Damer</option>
  				<option value="2">Herrar 1</option>
  				<option value="3">Herrar 2</option>
			</select>
		</li>
		<li>
		<p>Lagnamn*:</i><br> <input type="text" name="teamname" /></p>
		</li>
		<li>
		<p>Användarnamn*:<br> <input type="text" name="regusername" /></p>
		</li>
		<li>
		<p>Lösenord*:<br> <input type="password" name="regpassword" /></p>
		</li>
		<li>
		<p>Lösenord(igen)*:<br> <input type="password" name="regpassword_again" /></p>
		</li>
		<li>
		<p>Lagledarens information, d.v.s. DU!:</p>
		</li>
		<li>
		<p>Förnamn*:<br> <input type="text" name="firstname" /></p>
		</li>
		<li>
		<p>Efternamn*:<br> <input type="text" name="surname" /></p>
		</li>
		<li>
		<p>E-mail*:<br> <input type="text" name="email" /></p>
		</li>
		<li>
		<p>Tel.nr*:<br> <input type="text" name="phonenr" /></p>
		</li>	

		<input type="submit" value ="Registrera lag" name="submitteam" />
	</ul>

