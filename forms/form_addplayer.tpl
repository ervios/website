<html>
<meta http-equiv="content-type" content="text/html; charset=utf8" />

	<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post" />
	<p>Lag id: 	<input type="text" name="team_id" /></p>
	<p>Spelarnamn: 	<input type="text" name="player_name" /></p>
	<p>Kapten: 	<input type="text" name="captain" /></p>
	<p>Född: 	<input type="text" name="born" /></p>
	<p>Säsonger: 	<input type="text" name="playerSeason" /></p>
	<p>Mål: <input type="text" name="scoredGoals" /></p>

<input type="submit" value ="Skicka" name="submitplayer" />
</html>