
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>korpen.ax</title>
</head>
<body>


<div id="divcontainer">

	
	<div id="divheader"><h2>Inloggad som: User1</h2><h3>Logga ut --></h3><h1>Korpfotboll - Åland</h1></div>
		<div id="divline"></div>
		
			<div id="divlinks">
					<div id="divnav">
						<ul>
							<li><a href="index.html">Start</a></li>
							<li><a href="matcher.html" class="current">Matcher</a></li>
							<li><a href="skytteliga.html">Skytteliga</a></li>
							<li><a href="dittlag.html">Ditt lag</a></li>
							<li><a href="forum.html">Forum</a></li>
							<li><a href="info.html">Info</a></li>
						</ul>
					</div>
			</div>
		<div id="divline"></div>
	
	<div id="divstartbody">
		<div id="divcontent"><img src="pics/boll.jpg" width="140" height="140" />
		<h5>Matcher</h5>


<?php

require 'connect.init.php';

$query_teams = "SELECT `teamname` FROM `team`";
$query_test = mysql_query($query_teams);
$query_rowe = mysql_fetch_assoc($query_test);


$query = "SELECT * FROM `matchresult` ORDER BY `date`";
$query_run = mysql_query($query);

if ($query_run = mysql_query($query)) {

	while ($query_row = mysql_fetch_assoc($query_run)) {
$test = $query_rowe['teamname'];
echo $test.' ';
		$teamOneResult = $query_row['teamonescore'];
		$teamTwoResult = $query_row['teamtwoscore'];
		echo $teamOneResult.' - '. $teamTwoResult.'<br>' ;
	}

}
else {
	echo mysql_error();
}

?>
		</div>
	</div>
</div>
	


</body>
</html>