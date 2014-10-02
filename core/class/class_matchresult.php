<?php

require_once ("class_dbconnection.php");

class MatchResult {

	private $sql;
	private $matchdb;
	private $view;

	public function __construct() {

		$this->matchdb = new DBconnection();
		$this->matchdb = $this->matchdb->connect();
	}

	public function getAllMatchResults() {

		$this->sql = $this->getMatchSQL('all');
		$query = $this->matchdb->prepare($this->sql);
		$query->execute();
		$result = $query->fetchAll(PDO::FETCH_NUM);
	return $result;
	}

	public function getMatchSQL($sqlval) {

		switch ($sqlval) {
			case 'all':
				$sql = "SELECT teamA.teamname, res.teamonescore, res.teamtwoscore, teamB.teamname
						FROM matchresult AS res
						INNER JOIN team AS teamA ON teamA.team_id = res.team_oneID
						INNER JOIN team AS teamB ON teamB.team_id = res.team_twoID;";
					return $sql;
				break;
			case 'herrdiv1':
				$sql = "SELECT teamA.teamname, res.teamonescore, res.teamtwoscore, teamB.teamname
						FROM matchresult AS res
						INNER JOIN team AS teamA ON teamA.id = res.team_oneID
						INNER JOIN team AS teamB ON teamB.id = res.team_twoID
						WHERE teamA.div_id = 1;";
					return $sql;
				break;
			case 'herrdiv2':
				$sql = "SELECT teamA.teamname, res.teamonescore, res.teamtwoscore, teamB.teamname
						FROM matchresult AS res
						INNER JOIN team AS teamA ON teamA.id = res.team_oneID
						INNER JOIN team AS teamB ON teamB.id = res.team_twoID
						WHERE teamA.div_id = 2;";
					return $sql;
				break;
			case 'damer':
				$sql = "SELECT teamA.teamname, res.teamonescore, res.teamtwoscore, teamB.teamname
						FROM matchresult AS res
						INNER JOIN team AS teamA ON teamA.id = res.team_oneID
						INNER JOIN team AS teamB ON teamB.id = res.team_twoID
						WHERE teamA.div_id = 3;";
					return $sql;
				break;
		}
	}
}

?>