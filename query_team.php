<?php

class Team {
	
	private $teamname;
	
	public function getAllTeams() {
		
		$query = "SELECT * FROM `team` ORDER BY `team_id`";
		$query_run = mysql_query($query);
		
		if ($query_run = mysql_query($query)) {
		
			while ($query_row = mysql_fetch_assoc($query_run)) {
				$teamname = $query_row['teamname'];
				echo $teamname. '<br>';
			}
		
		}
		else {
			echo mysql_error();
		}
		
		
	}
	
	public function getTeamJersey() {
		
		$query_jersey = "SELECT `jerseycolor` FROM `team` ORDER BY `team_id`";
		$query_run = mysql_query($query_jersey);
		
		if ($query_run = mysql_query($query_jersey)) {
		
			while ($query_row = mysql_fetch_assoc($query_run)) {
				$jerseycolor = $query_row['jerseycolor'];
				echo $jerseycolor.'<br>';
			}
		
		}
		else {
			echo mysql_error();
		}
		
	}

	
}



?>