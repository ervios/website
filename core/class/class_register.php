<?php

class Register {

	private $db;
	private $tplreg;	

	function __construct() {

			$this->db = new DBconnection();
			$this->db = $this->db->connect();
	}

	public function email_exists($email) {

			$sql = "SELECT COUNT(`user_id`) FROM `users` WHERE `email` = '$email'";
			$sqlquery = $this->db->prepare($sql);
			$sqlquery->execute();

			return ($sqlquery->fetchColumn() == 1) ? true : false;
		}


	public function register_team($register_data) {

		//Inserting team info to DB - first due to team_id for users
		$sql = "INSERT INTO `team` (div_id, teamname) VALUES (?, ?)";
		$sqlquery = $this->db->prepare($sql);
		$sqlquery->bindParam(1, $register_data['div_id']);
		$sqlquery->bindParam(2, $register_data['teamname']);
		$sqlquery->execute();
		$team_id = $this->db->lastInsertId();
		//Inserting user info to DB
		$sql = "INSERT INTO `users` (team_id, username, password, first_name, last_name, email, phonenr)
				VALUES (?, ?, md5(?), ?, ?, ?, ?)";
		$sqlquery = $this->db->prepare($sql);
		$sqlquery->bindParam(1, $team_id);
		$sqlquery->bindParam(2, $register_data['regusername']);
		$sqlquery->bindParam(3, $register_data['regpassword']);
		$sqlquery->bindParam(4, $register_data['firstname']);
		$sqlquery->bindParam(5, $register_data['surname']);
		$sqlquery->bindParam(6, $register_data['email']);
		$sqlquery->bindParam(7, $register_data['phonenr']);
		$sqlquery->execute();

		$_SESSION['ok'] = true;
		//header('Location: register_user.php');
		return $_SESSION['ok'];

		}

}


?>