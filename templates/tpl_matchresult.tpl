
<div id="divcontent">
<h3> Matchresultat </h3>
<div id="divlinereg"></div>

<div id="matchresult">

<?php 
$j = 0;
echo "<table><tr><th>TEAMONE</th><th>SCORE</th><th>SCORE</th><th>TEAMTWO</th></tr>";

foreach ($_SESSION['matches'] as $row) {
echo "<tr><td>" . $row[$j] . "</td><td id=\"score\">" . $row[++$j] . "</td><td>" . $row[++$j] ."</td><td>" .  $row[++$j] . "</td></tr>" ;
$j = 0;
}

?>
</div>
</div>
